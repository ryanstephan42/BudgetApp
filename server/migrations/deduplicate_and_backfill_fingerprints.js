const { pool } = require('../database');
const crypto = require('crypto');

const deduplicateAndBackfill = async () => {
  const client = await pool.connect();
  try {
    console.log('Starting deduplication and backfill...');
    await client.query('BEGIN');

    // 1. Fetch all transactions
    const res = await client.query('SELECT * FROM transactions');
    const transactions = res.rows;
    console.log(`Fetched ${transactions.length} transactions.`);

    const seenFingerprints = new Map();
    const toDeleteIds = [];
    const toUpdate = [];

    // 2. Process transactions to find duplicates and calculate fingerprints
    for (const t of transactions) {
      // Generate fingerprint: date-description-amount (ensure date is formatted consistently)
      // Note: Date from postgres comes as a Date object. We need to format it as YYYY-MM-DD to match the CSV/Input format usually.
      // However, the CSV parser sends string. The DB stores DATE.
      // Let's use the ISO string part for consistency: YYYY-MM-DD.
      const dateStr = new Date(t.date).toISOString().split('T')[0];
      const normalizedDescription = (t.description || '').trim();
      const normalizedAmount = parseFloat(t.amount).toFixed(2);
      
      // Create hash
      const fingerprint = crypto
        .createHash('sha256')
        .update(`${dateStr}-${normalizedDescription}-${normalizedAmount}`)
        .digest('hex');

      if (seenFingerprints.has(fingerprint)) {
        // Duplicate found! Mark this ID for deletion
        toDeleteIds.push(t.id);
      } else {
        // First time seeing this fingerprint. Mark for update.
        seenFingerprints.set(fingerprint, t.id);
        toUpdate.push({ id: t.id, fingerprint });
      }
    }

    console.log(`Found ${toDeleteIds.length} duplicate transactions to delete.`);
    console.log(`Found ${toUpdate.length} unique transactions to backfill fingerprints.`);

    // 3. Delete duplicates
    if (toDeleteIds.length > 0) {
      // Batch delete
      await client.query(`DELETE FROM transactions WHERE id = ANY($1::uuid[])`, [toDeleteIds]);
      console.log('Deleted duplicates.');
    }

    // 4. Backfill fingerprints
    // Updating one by one is slow but safe for this migration script.
    for (const item of toUpdate) {
      await client.query('UPDATE transactions SET fingerprint = $1 WHERE id = $2', [item.fingerprint, item.id]);
    }
    console.log('Backfilled fingerprints.');

    // 5. Add NOT NULL constraint to prevent future nulls
    await client.query('ALTER TABLE transactions ALTER COLUMN fingerprint SET NOT NULL');
    console.log('Added NOT NULL constraint to fingerprint column.');

    await client.query('COMMIT');
    console.log('Deduplication and backfill complete.');

  } catch (err) {
    await client.query('ROLLBACK');
    console.error('Error during deduplication:', err);
    process.exit(1);
  } finally {
    client.release();
    pool.end();
  }
};

deduplicateAndBackfill();
