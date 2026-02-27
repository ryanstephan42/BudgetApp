const { pool } = require('../database');

const addFingerprintColumn = async () => {
  try {
    // Add the fingerprint column if it doesn't exist
    await pool.query(`
      ALTER TABLE transactions 
      ADD COLUMN IF NOT EXISTS fingerprint VARCHAR(64);
    `);
    
    // Create a unique index on the fingerprint column
    // This ensures that we can't have duplicate fingerprints
    await pool.query(`
      CREATE UNIQUE INDEX IF NOT EXISTS idx_transactions_fingerprint 
      ON transactions(fingerprint);
    `);

    console.log('Successfully added fingerprint column and unique index.');
  } catch (err) {
    console.error('Error adding fingerprint column:', err.stack);
    process.exit(1);
  } finally {
    pool.end();
  }
};

addFingerprintColumn();
