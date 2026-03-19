const express = require('express');
const { v4: uuidv4 } = require('uuid');
const crypto = require('crypto');
const multer = require('multer'); // Import multer
const path = require('path'); // Import path module
const natural = require('natural');
const { pool } = require('../database'); // Import the pool from database.js

const router = express.Router();

// Helper function to normalize date to YYYY-MM-DD
const normalizeDate = (dateStr) => {
  const d = new Date(dateStr);
  if (isNaN(d.getTime())) return dateStr; // Return as is if invalid
  return d.toISOString().split('T')[0];
};

// Helper function to generate fingerprint
const generateFingerprint = (date, description, amount) => {
  const normalizedDate = normalizeDate(date);
  const normalizedDescription = (description || '').trim();
  const normalizedAmount = parseFloat(amount).toFixed(2);
  return crypto
    .createHash('sha256')
    .update(`${normalizedDate}-${normalizedDescription}-${normalizedAmount}`)
    .digest('hex');
};

// Helper function to execute queries
const query = async (text, params) => {
  const client = await pool.connect();
  try {
    return await client.query(text, params);
  } finally {
    client.release();
  }
};

// --- Multer Configuration for Receipt Uploads ---
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'uploads/'); // Receipts will be stored in the 'uploads/' directory
  },
  filename: (req, file, cb) => {
    // Generate a unique filename: transactionId-originalName-timestamp.ext
    const transactionId = req.params.id;
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    const fileExtension = path.extname(file.originalname);
    cb(null, `${transactionId}-${uniqueSuffix}${fileExtension}`);
  },
});

const upload = multer({ storage: storage });

// --- Transaction Routes ---

// Get all transactions with optional filters
router.get('/transactions', async (req, res) => {
  try {
    const { startDate, endDate, textFilter, categoryFilter, groupFilter } = req.query;
    let queryText = 'SELECT * FROM transactions WHERE TRUE';
    const queryParams = [];
    let paramIndex = 1;

    if (startDate) {
      queryText += ` AND date >= $${paramIndex++}`;
      queryParams.push(startDate);
    }
    if (endDate) {
      queryText += ` AND date <= $${paramIndex++}`;
      queryParams.push(endDate);
    }
    if (textFilter) {
      queryText += ` AND description ILIKE $${paramIndex++}`;
      queryParams.push(`%${textFilter}%`);
    }
    if (categoryFilter) {
      queryText += ` AND category = $${paramIndex++}`;
      queryParams.push(categoryFilter);
    }
    if (groupFilter && groupFilter.length > 0) {
      // groupFilter can be a comma-separated string of IDs
      const groupIds = groupFilter.split(',');
      queryText += ` AND group_id = ANY($${paramIndex++}::uuid[])`;
      queryParams.push(groupIds);
    }

    queryText += ' ORDER BY date DESC';
    const result = await query(queryText, queryParams);
    res.json(result.rows);
  } catch (err) {
    console.error('Error fetching transactions:', err.stack);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Add a new transaction
router.post('/transactions', upload.single('receipt'), async (req, res) => {
  try {
    // Process inputs
    const transactionData = { ...req.body };
    
    if (req.file) {
      transactionData.receipt_path = req.file.path;
    }

    if (transactionData.splits) {
      try {
         // If string (FormData), validate and use as is. If object, stringify.
         if (typeof transactionData.splits === 'string') {
             JSON.parse(transactionData.splits); // Validate
             transactionData.split_details = transactionData.splits;
         } else {
             transactionData.split_details = JSON.stringify(transactionData.splits);
         }
         transactionData.is_split = true;
      } catch (e) {
        console.error('Error parsing splits:', e);
         return res.status(400).json({ error: 'Invalid splits format' });
      }
    }

    let { date, description, amount, category, group_id, is_ignored, raw_data, is_split, split_details, receipt_path, debt_id } = transactionData;
    description = (description || '').trim();
    const id = uuidv4();

    // Auto-categorize if not provided or Uncategorized
    if (!category || category === 'Uncategorized') {
      category = await suggestCategory(description);
    }

    // Generate fingerprint
    const fingerprint = generateFingerprint(date, description, amount);

    const result = await query(
      'INSERT INTO transactions (id, date, description, amount, category, group_id, is_ignored, raw_data, fingerprint, is_split, split_details, receipt_path, debt_id) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13) ON CONFLICT (fingerprint) DO NOTHING RETURNING *',
      [id, normalizeDate(date), description, amount, category, group_id, is_ignored || false, raw_data, fingerprint, is_split || false, split_details, receipt_path, debt_id]
    );
    
    if (result.rows.length === 0) {
       // Transaction already exists
       return res.status(409).json({ error: 'Transaction already exists' });
    }

    // If debt_id is present and transaction was inserted, update the current_balance of the debt
    if (debt_id) {
      await query(
        'UPDATE debts SET current_balance = current_balance - $1 WHERE id = $2',
        [amount, debt_id]
      );
    }

    res.status(201).json(result.rows[0]);
  } catch (err) {
    console.error('Error adding transaction:', err.stack);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Bulk add transactions
router.post('/transactions/bulk', async (req, res) => {
  try {
    const transactions = req.body;
    if (!Array.isArray(transactions) || transactions.length === 0) {
      return res.status(400).json({ error: 'Invalid input: expected an array of transactions' });
    }

    let insertedCount = 0;
    const client = await pool.connect();

    try {
      await client.query('BEGIN');

      for (const transaction of transactions) {
        let { date, description, amount, category, group_id, is_ignored, raw_data, is_split, split_details, receipt_path } = transaction;
        description = (description || '').trim();
        const id = uuidv4();
        
        // Auto-categorize if not provided or Uncategorized
        if (!category || category === 'Uncategorized') {
          category = await suggestCategory(description);
        }

        // Generate fingerprint
        const fingerprint = generateFingerprint(date, description, amount);

        const result = await client.query(
          'INSERT INTO transactions (id, date, description, amount, category, group_id, is_ignored, raw_data, fingerprint, is_split, split_details, receipt_path) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12) ON CONFLICT (fingerprint) DO NOTHING RETURNING id',
          [id, normalizeDate(date), description, amount, category, group_id, is_ignored || false, raw_data, fingerprint, is_split || false, split_details, receipt_path]
        );

        if (result.rowCount > 0) {
          insertedCount++;
        }
      }

      await client.query('COMMIT');
      res.status(201).json({ message: `Successfully processed ${transactions.length} transactions. Inserted ${insertedCount} new transactions.` });
    } catch (err) {
      await client.query('ROLLBACK');
      throw err;
    } finally {
      client.release();
    }
  } catch (err) {
    console.error('Error bulk adding transactions:', err.stack);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Update a transaction
router.put('/transactions/:id', upload.single('receipt'), async (req, res) => {
  const client = await pool.connect(); // Acquire a client for the transaction
  try {
    await client.query('BEGIN'); // Start transaction

    const { id } = req.params;
    const updates = { ...req.body };

    // Convert empty string debt_id to null if present
    if (updates.debt_id === '') {
      updates.debt_id = null;
    }

    // Handle file upload
    if (req.file) {
      updates.receipt_path = req.file.path;
    }

    // Handle splits (coming from FormData as JSON string, or JSON body as object)
    if (updates.splits) {
      try {
        if (typeof updates.splits === 'string') {
             JSON.parse(updates.splits); // Validate
             updates.split_details = updates.splits;
         } else {
             updates.split_details = JSON.stringify(updates.splits);
         }
        updates.is_split = true;
      } catch (e) {
        console.error('Error parsing splits:', e);
        await client.query('ROLLBACK');
        return res.status(400).json({ error: 'Invalid splits format' });
      }
      delete updates.splits;
    }

    // 1. Fetch the old transaction to compare values
    const oldTransactionResult = await client.query('SELECT * FROM transactions WHERE id = $1', [id]);
    if (oldTransactionResult.rows.length === 0) {
      await client.query('ROLLBACK');
      return res.status(404).json({ error: 'Transaction not found' });
    }
    const oldTransaction = oldTransactionResult.rows[0];

    if (updates.description !== undefined) {
      updates.description = updates.description.trim();
    }

    // Recalculate fingerprint if necessary
    if (updates.date !== undefined || updates.description !== undefined || updates.amount !== undefined) {
      const newDate = updates.date !== undefined ? updates.date : oldTransaction.date;
      const newDescription = updates.description !== undefined ? updates.description : oldTransaction.description;
      const newAmountVal = updates.amount !== undefined ? updates.amount : oldTransaction.amount;
      
      updates.fingerprint = generateFingerprint(newDate, newDescription, newAmountVal);
    }

    const updateKeys = Object.keys(updates).filter(key =>
      ['date', 'description', 'amount', 'category', 'group_id', 'is_ignored', 'raw_data', 'is_split', 'split_details', 'receipt_path', 'debt_id', 'fingerprint'].includes(key)
    );

    if (updateKeys.length === 0) {
      await client.query('ROLLBACK');
      return res.status(400).json({ error: 'No valid fields to update' });
    }

    // 2. Adjust debt balances based on changes
    const oldDebtId = oldTransaction.debt_id;
    const newDebtId = updates.debt_id !== undefined ? updates.debt_id : oldDebtId; // Use provided new debt_id or keep old
    const oldAmount = parseFloat(oldTransaction.amount);
    const newAmount = updates.amount !== undefined ? parseFloat(updates.amount) : oldAmount;

    // Case 1: Debt ID changed or removed
    if (oldDebtId && oldDebtId !== newDebtId) {
      // Add old amount back to the old debt
      await client.query(
        'UPDATE debts SET current_balance = current_balance + $1 WHERE id = $2',
        [oldAmount, oldDebtId]
      );
    }

    // Case 2: Debt ID added or changed to a new one
    if (newDebtId && oldDebtId !== newDebtId) {
      // Subtract new amount from the new debt
      await client.query(
        'UPDATE debts SET current_balance = current_balance - $1 WHERE id = $2',
        [newAmount, newDebtId]
      );
    }

    // Case 3: Debt ID is the same, but amount changed
    if (newDebtId && oldDebtId === newDebtId && newAmount !== oldAmount) {
      // Adjust balance by the difference (oldAmount - newAmount)
      // If newAmount > oldAmount (payment increased), then current_balance decreases further
      // If newAmount < oldAmount (payment decreased), then current_balance increases
      const amountDifference = oldAmount - newAmount;
      await client.query(
        'UPDATE debts SET current_balance = current_balance + $1 WHERE id = $2',
        [amountDifference, newDebtId]
      );
    }
    
    // 3. Update the transaction itself
    const setClauses = updateKeys.map((key, index) => `${key} = $${index + 1}`).join(', ');
    const queryParams = updateKeys.map(key => updates[key]);
    queryParams.push(id); // Add id for the WHERE clause

    const queryText = `UPDATE transactions SET ${setClauses} WHERE id = $${queryParams.length} RETURNING *`;
    
    const result = await client.query(queryText, queryParams);
    
    await client.query('COMMIT'); // Commit transaction
    res.json(result.rows[0]);
  } catch (err) {
    await client.query('ROLLBACK'); // Rollback on error
    console.error('Error updating transaction:', err.stack);
    res.status(500).json({ error: 'Internal server error' });
  } finally {
    client.release(); // Release client
  }
});

// Upload receipt for a transaction
router.post('/transactions/:id/receipt', upload.single('receipt'), async (req, res) => {
  try {
    const { id } = req.params;
    if (!req.file) {
      return res.status(400).json({ error: 'No file uploaded.' });
    }

    const receiptPath = req.file.path; // Multer saves the path to req.file.path

    const result = await query(
      'UPDATE transactions SET receipt_path = $1 WHERE id = $2 RETURNING *',
      [receiptPath, id]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Transaction not found' });
    }

    res.status(200).json({ message: 'Receipt uploaded successfully', transaction: result.rows[0] });
  } catch (err) {
    console.error('Error uploading receipt:', err.stack);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Delete a transaction
router.delete('/transactions/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const result = await query('DELETE FROM transactions WHERE id = $1 RETURNING *', [id]);
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Transaction not found' });
    }

    const deletedTransaction = result.rows[0];
    if (deletedTransaction.debt_id) {
      await query(
        'UPDATE debts SET current_balance = current_balance + $1 WHERE id = $2',
        [deletedTransaction.amount, deletedTransaction.debt_id]
      );
    }

    res.status(204).send(); // No content
  } catch (err) {
    console.error('Error deleting transaction:', err.stack);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// --- AI Categorization Route ---

// Helper function to suggest category
const suggestCategory = async (description) => {
  try {
    const result = await query(
      "SELECT description, category FROM transactions WHERE category IS NOT NULL AND category != 'Uncategorized'"
    );

    if (result.rows.length < 5) {
      return 'Uncategorized';
    }

    const classifier = new natural.BayesClassifier();
    result.rows.forEach(row => {
      classifier.addDocument(row.description, row.category);
    });

    classifier.train();
    return classifier.classify(description);
  } catch (err) {
    console.error('Error in suggestCategory:', err);
    return 'Uncategorized';
  }
};

// Suggest a category for a transaction description
router.get('/categorize', async (req, res) => {
  try {
    const { description } = req.query;
    if (!description) {
      return res.status(400).json({ error: 'Description is required' });
    }

    const category = await suggestCategory(description);
    res.json({ category });
  } catch (err) {
    console.error('Error categorizing transaction:', err.stack);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// --- Category Routes ---

// Get all categories
router.get('/categories', async (req, res) => {
  try {
    const result = await query('SELECT * FROM categories ORDER BY name');
    res.json(result.rows);
  } catch (err) {
    console.error('Error fetching categories:', err.stack);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Add a new category
router.post('/categories', async (req, res) => {
  try {
    const { name, allocated } = req.body;
    let result;
    if (allocated !== undefined) {
      result = await query('INSERT INTO categories (name, allocated) VALUES ($1, $2) ON CONFLICT (name) DO UPDATE SET allocated = EXCLUDED.allocated RETURNING *', [name, allocated]);
    } else {
      result = await query('INSERT INTO categories (name) VALUES ($1) ON CONFLICT (name) DO NOTHING RETURNING *', [name]);
      if (result.rows.length === 0) {
        result = await query('SELECT * FROM categories WHERE name = $1', [name]);
    }
    }

    res.status(201).json(result.rows[0]);
  } catch (err) {
    console.error('Error adding category:', err.stack);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Update a category (specifically allocated amount)
router.put('/categories/:name', async (req, res) => {
  try {
    const { name } = req.params;
    const { allocated } = req.body;
    if (allocated === undefined) {
      return res.status(400).json({ error: 'Allocated amount is required for update' });
    }
    const result = await query('UPDATE categories SET allocated = $1 WHERE name = $2 RETURNING *', [allocated, name]);
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Category not found' });
    }
    res.json(result.rows[0]);
  } catch (err) {
    console.error('Error updating category:', err.stack);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Delete a category
router.delete('/categories/:name', async (req, res) => {
  try {
    const { name } = req.params;
    const result = await query('DELETE FROM categories WHERE name = $1 RETURNING *', [name]);
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Category not found' });
    }
    res.status(204).send();
  } catch (err) {
    console.error('Error deleting category:', err.stack);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// --- Group Routes ---

// Get all groups
router.get('/groups', async (req, res) => {
  try {
    const result = await query('SELECT * FROM groups ORDER BY name');
    res.json(result.rows);
  } catch (err) {
    console.error('Error fetching groups:', err.stack);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Add a new group
router.post('/groups', async (req, res) => {
  try {
    const { name } = req.body;
    const id = uuidv4();
    const result = await query('INSERT INTO groups (id, name) VALUES ($1, $2) ON CONFLICT (name) DO NOTHING RETURNING *', [id, name]);
    if (result.rows.length === 0) {
      return res.status(409).json({ error: 'Group with this name already exists' });
    }
    res.status(201).json(result.rows[0]);
  } catch (err) {
    console.error('Error adding group:', err.stack);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Update a group
router.put('/groups/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const { name } = req.body;
    const result = await query('UPDATE groups SET name = $1 WHERE id = $2 RETURNING *', [name, id]);
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Group not found' });
    }
    res.json(result.rows[0]);
  } catch (err) {
    console.error('Error updating group:', err.stack);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Delete a group
router.delete('/groups/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const result = await query('DELETE FROM groups WHERE id = $1 RETURNING *', [id]);
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Group not found' });
    }
    res.status(204).send();
  } catch (err) {
    console.error('Error deleting group:', err.stack);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// --- Goals Routes ---

// Get all goals
router.get('/goals', async (req, res) => {
  try {
    const result = await query('SELECT * FROM goals ORDER BY name');
    res.json(result.rows);
  } catch (err) {
    console.error('Error fetching goals:', err.stack);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Add a new goal
router.post('/goals', async (req, res) => {
  try {
    const { name, target_amount, current_amount, target_date } = req.body;
    const result = await query(
      'INSERT INTO goals (id, name, target_amount, current_amount, target_date) VALUES (gen_random_uuid(), $1, $2, $3, $4) RETURNING *',
      [name, target_amount, current_amount || 0, target_date]
    );
    res.status(201).json(result.rows[0]);
  } catch (err) {
    console.error('Error adding goal:', err.stack);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Update a goal
router.put('/goals/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const updates = req.body;
    const updateKeys = Object.keys(updates).filter(key =>
      ['name', 'target_amount', 'current_amount', 'target_date'].includes(key)
    );

    if (updateKeys.length === 0) {
      return res.status(400).json({ error: 'No valid fields to update' });
    }

    const setClauses = updateKeys.map((key, index) => `${key} = $${index + 1}`).join(', ');
    const queryParams = updateKeys.map(key => updates[key]);
    queryParams.push(id); // Add id for the WHERE clause

    const queryText = `UPDATE goals SET ${setClauses} WHERE id = $${queryParams.length} RETURNING *`;

    const result = await query(queryText, queryParams);
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Goal not found' });
    }
    res.json(result.rows[0]);
  } catch (err) {
    console.error('Error updating goal:', err.stack);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Delete a goal
router.delete('/goals/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const result = await query('DELETE FROM goals WHERE id = $1 RETURNING *', [id]);
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Goal not found' });
    }
    res.status(204).send();
  } catch (err) {
    console.error('Error deleting goal:', err.stack);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Delete a goal
router.delete('/goals/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const result = await query('DELETE FROM goals WHERE id = $1 RETURNING *', [id]);
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Goal not found' });
    }
    res.status(204).send();
  } catch (err) {
    console.error('Error deleting goal:', err.stack);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// --- Debt Routes ---

// Get all debts
router.get('/debts', async (req, res) => {
  try {
    const result = await query('SELECT * FROM debts ORDER BY name');
    res.json(result.rows);
  } catch (err) {
    console.error('Error fetching debts:', err.stack);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Add a new debt
router.post('/debts', async (req, res) => {
  try {
    const { name, starting_balance, current_balance, interest_rate, min_payment, due_date } = req.body;
    const result = await query(
      'INSERT INTO debts (id, name, starting_balance, current_balance, interest_rate, min_payment, due_date) VALUES (gen_random_uuid(), $1, $2, $3, $4, $5, $6) RETURNING *',
      [name, starting_balance, current_balance || starting_balance, interest_rate || 0, min_payment || 0, due_date]
    );
    res.status(201).json(result.rows[0]);
  } catch (err) {
    console.error('Error adding debt:', err.stack);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Update a debt
router.put('/debts/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const updates = req.body;
    const updateKeys = Object.keys(updates).filter(key =>
      ['name', 'starting_balance', 'current_balance', 'interest_rate', 'min_payment', 'due_date'].includes(key)
    );

    if (updateKeys.length === 0) {
      return res.status(400).json({ error: 'No valid fields to update' });
    }

    const setClauses = updateKeys.map((key, index) => `${key} = $${index + 1}`).join(', ');
    const queryParams = updateKeys.map(key => updates[key]);
    queryParams.push(id); // Add id for the WHERE clause

    const queryText = `UPDATE debts SET ${setClauses} WHERE id = $${queryParams.length} RETURNING *`;

    const result = await query(queryText, queryParams);
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Debt not found' });
    }
    res.json(result.rows[0]);
  } catch (err) {
    console.error('Error updating debt:', err.stack);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Delete a debt
router.delete('/debts/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const result = await query('DELETE FROM debts WHERE id = $1 RETURNING *', [id]);
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Debt not found' });
    }
    res.status(204).send();
  } catch (err) {
    console.error('Error deleting debt:', err.stack);
    res.status(500).json({ error: 'Internal server error' });
  }
});

module.exports = router;
