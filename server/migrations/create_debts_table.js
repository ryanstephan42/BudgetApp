const { Pool } = require('pg');
const dotenv = require('dotenv');
const path = require('path');

dotenv.config({ path: path.resolve(__dirname, '../.env') });

const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
});

const createDebtsTable = async () => {
  try {
    await pool.query(`
      CREATE TABLE IF NOT EXISTS debts (
        id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
        name VARCHAR(255) NOT NULL,
        starting_balance DECIMAL(10, 2) NOT NULL,
        current_balance DECIMAL(10, 2) NOT NULL,
        interest_rate DECIMAL(5, 2) DEFAULT 0, -- e.g., 5.5%
        min_payment DECIMAL(10, 2) DEFAULT 0,
        due_date INT -- Day of month (e.g., 15)
      );

      ALTER TABLE transactions ADD COLUMN IF NOT EXISTS debt_id UUID REFERENCES debts(id) ON DELETE SET NULL;
    `);
    console.log('Debts table created and transactions table altered, or already exists.');
  } catch (err) {
    console.error('Error creating debts table and altering transactions table:', err.stack);
    process.exit(1);
  } finally {
    pool.end(); // Close the pool after migration
  }
};

createDebtsTable();
