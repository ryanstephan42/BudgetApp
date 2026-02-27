// Run this script in your browser's developer console on the frontend application.
// IMPORTANT: Run this on the device that currently has your budget data in its localStorage.

const API_BASE_URL = 'http://localhost:5500/api';

async function migrateData() {
  console.log('Starting data migration...');

  // --- Migrate Categories ---
  const storedBudgets = JSON.parse(localStorage.getItem('budgets') || '[]');
  for (const budget of storedBudgets) {
    try {
      await fetch(`${API_BASE_URL}/categories`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ name: budget.category }),
      });
      console.log(`Migrated category: ${budget.category}`);
    } catch (error) {
      console.error(`Error migrating category ${budget.category}:`, error);
    }
  }

  // --- Migrate Groups ---
  const storedGroups = JSON.parse(localStorage.getItem('groups') || '[]');
  for (const group of storedGroups) {
    try {
      await fetch(`${API_BASE_URL}/groups`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ name: group.name }), // Backend generates ID
      });
      console.log(`Migrated group: ${group.name}`);
    } catch (error) {
      console.error(`Error migrating group ${group.name}:`, error);
    }
  }

  // --- Migrate Transactions ---
  const storedTransactions = JSON.parse(localStorage.getItem('transactions') || '[]');
  for (const transaction of storedTransactions) {
    try {
      // Fetch the actual group_id from the backend if group name exists
      let group_id = null;
      if (transaction.group) {
        const response = await fetch(`${API_BASE_URL}/groups`);
        const groups = await response.json();
        const matchingGroup = groups.find(g => g.name === transaction.group);
        if (matchingGroup) {
          group_id = matchingGroup.id;
        }
      }

      const newTransaction = {
        date: transaction.date,
        description: transaction.description,
        amount: transaction.amount,
        category: transaction.category || 'Uncategorized', // Ensure category exists
        group_id: group_id,
        is_ignored: transaction.isIgnored || false,
        raw_data: transaction.rawData || {},
      };

      await fetch(`${API_BASE_URL}/transactions`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(newTransaction),
      });
      console.log(`Migrated transaction: ${transaction.description}`);
    } catch (error) {
      console.error(`Error migrating transaction ${transaction.description}:`, error);
    }
  }

  console.log('Data migration complete. You can now clear your localStorage.');
}

migrateData();
