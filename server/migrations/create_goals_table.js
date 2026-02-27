const { pool } = require('../database');

const createGoalsTable = async () => {
  try {
    await pool.query(`
      CREATE TABLE IF NOT EXISTS goals (
        id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
        name VARCHAR(255) NOT NULL,
        target_amount NUMERIC(10, 2) NOT NULL DEFAULT 0.00,
        current_amount NUMERIC(10, 2) NOT NULL DEFAULT 0.00,
        target_date DATE
      );
    `);
    console.log('Goals table created or already exists.');
  } catch (err) {
    console.error('Error creating goals table:', err.stack);
    process.exit(1);
  } finally {
    pool.end(); // Close the pool after migration
  }
};

createGoalsTable();
