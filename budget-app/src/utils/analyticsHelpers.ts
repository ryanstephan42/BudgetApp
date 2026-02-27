import type { Transaction, Budget } from '../context/AppContext';

// Helper to format date to YYYY-MM
const getMonthYear = (dateString: string): string => {
  const date = new Date(dateString);
  return `${date.getFullYear()}-${(date.getMonth() + 1).toString().padStart(2, '0')}`;
};

/**
 * Calculates the spending breakdown by category for expenses.
 * Converts expense amounts to positive values for visualization.
 * @param transactions - Array of Transaction objects
 * @returns An array of objects: { name: categoryName, value: totalSpentForCategory }
 */
export const calculateCategoryBreakdown = (transactions: Transaction[]): { name: string; value: number }[] => {
  const categoryMap = new Map<string, number>();

  transactions.forEach((t) => {
    // According to app's convention: expenses are positive amounts
    if (t.amount > 0 && !t.is_ignored) {
      const currentAmount = categoryMap.get(t.category) || 0;
      categoryMap.set(t.category, currentAmount + t.amount);
    }
  });

  return Array.from(categoryMap.entries()).map(([name, value]) => ({
    name,
    value: parseFloat(value.toFixed(2)), // Ensure consistent number format
  }));
};

/**
 * Calculates budget adherence by comparing allocated budget to actual spent for each category.
 * Converts spent amounts to positive values.
 * @param transactions - Array of Transaction objects
 * @param budgets - Array of Budget objects
 * @returns An array of objects: { category: string, allocated: number, spent: number, difference: number }
 */
export const calculateBudgetVsActual = (transactions: Transaction[], budgets: Budget[]): { category: string; allocated: number; spent: number; difference: number }[] => {
  const spentByCategory = new Map<string, number>();

  transactions.forEach((t) => {
    // According to app's convention: expenses are positive amounts
    if (t.amount > 0 && !t.is_ignored) {
      const currentSpent = spentByCategory.get(t.category) || 0;
      spentByCategory.set(t.category, currentSpent + t.amount);
    }
  });

  return budgets.map((budget) => {
    const allocated = parseFloat(budget.allocated.toFixed(2));
    const spent = parseFloat((spentByCategory.get(budget.category) || 0).toFixed(2));
    const difference = spent - allocated; // Spent minus Allocated

    return {
      category: budget.category,
      allocated,
      spent,
      difference: parseFloat(difference.toFixed(2)),
    };
  });
};

/**
 * Calculates monthly cash flow (income and expenses) for all transactions.
 * Income and expense values are converted to positive for visualization.
 * @param transactions - Array of Transaction objects
 * @returns An array of objects: { month: 'YYYY-MM', income: totalIncome, expense: totalExpense }
 */
export const calculateMonthlyCashFlow = (transactions: Transaction[]): { month: string; income: number; expense: number }[] => {
  const monthlyDataMap = new Map<string, { income: number; expense: number }>();

  transactions.forEach((t) => {
    const month = getMonthYear(t.date);
    if (!monthlyDataMap.has(month)) {
      monthlyDataMap.set(month, { income: 0, expense: 0 });
    }
    const current = monthlyDataMap.get(month)!;

    if (!t.is_ignored) {
      // According to app's convention: expenses are positive, income is negative
      if (t.amount > 0) { // Expense
        current.expense += t.amount;
      } else { // Income (amount is negative, convert to positive for chart)
        current.income += Math.abs(t.amount);
      }
    }
  });

  // Convert map to array and sort chronologically
  const sortedMonths = Array.from(monthlyDataMap.keys()).sort();

  return sortedMonths.map((month) => {
    const data = monthlyDataMap.get(month)!;
    return {
      month,
      income: parseFloat(data.income.toFixed(2)),
      expense: parseFloat(data.expense.toFixed(2)),
    };
  });
};