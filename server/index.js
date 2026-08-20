const express = require('express');
const dotenv = require('dotenv');
const cors = require('cors');
const { pool, createTables } = require('./database');
const apiRoutes = require('./routes'); // Import API routes

dotenv.config();

const app = express();
const port = process.env.PORT || 3001;

app.use(cors());
// Bulk transaction imports (e.g. a full statement/CSV worth of transactions)
// can exceed Express's default 100kb JSON body limit, causing 413s. Raise it.
app.use(express.json({ limit: '25mb' }));

// Use API routes
app.use('/api', apiRoutes);

app.listen(port, async () => {
  console.log(`Server running on port ${port}`);
  await createTables();
});

app.get('/', (req, res) => {
  res.send('Budget App Backend is running!');
});
