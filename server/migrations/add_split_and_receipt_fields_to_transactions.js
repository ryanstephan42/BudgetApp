const { pool } = require('../database');

const addSplitAndReceiptFields = async () => {
  try {
    console.log('Adding split and receipt fields to transactions table...');
    await pool.query(`
      ALTER TABLE transactions
      ADD COLUMN IF NOT EXISTS is_split BOOLEAN DEFAULT FALSE,
      ADD COLUMN IF NOT EXISTS split_details JSONB,
      ADD COLUMN IF NOT EXISTS receipt_path VARCHAR(255);
    `);
    console.log('Split and receipt fields added to transactions table.');
  } catch (err) {
    console.error('Error adding split and receipt fields:', err.stack);
    process.exit(1);
  } finally {
    pool.end();
  }
};

addSplitAndReceiptFields();
