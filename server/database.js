const { Pool } = require('pg');
const dotenv = require('dotenv');

dotenv.config();

const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
});

const createTables = async () => {
  try {
    await pool.query(`
      CREATE TABLE IF NOT EXISTS categories (
        name VARCHAR(255) PRIMARY KEY,
        allocated DECIMAL(10, 2) DEFAULT 0
      );
    `);

    await pool.query(`
      CREATE TABLE IF NOT EXISTS groups (
        id UUID PRIMARY KEY,
        name VARCHAR(255) UNIQUE NOT NULL
      );
    `);

    await pool.query(`
      CREATE TABLE IF NOT EXISTS transactions (
        id UUID PRIMARY KEY,
        date DATE NOT NULL,
        description VARCHAR(255) NOT NULL,
        amount DECIMAL(10, 2) NOT NULL,
        category VARCHAR(255) REFERENCES categories(name) ON DELETE SET NULL,
        group_id UUID REFERENCES groups(id) ON DELETE SET NULL,
        is_ignored BOOLEAN DEFAULT FALSE,
        raw_data JSONB
      );
    `);
    console.log('Database tables created or already exist.');
  } catch (err) {
    console.error('Error creating database tables:', err.stack);
    process.exit(1); // Exit if tables cannot be created
  }
};

module.exports = {
  pool,
  createTables,
};
