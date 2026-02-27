import React, { useContext, useCallback } from 'react';
import { AppContext } from '../context/AppContext';
import type { Budget } from '../context/AppContext';

const PrintableBudgetsPage: React.FC = () => {
  const context = useContext(AppContext);

  const { budgets, budgetFilteredTransactions, ignoredCategories } = context!;

  const getSpentAmount = useCallback((category: string) => {
    return budgetFilteredTransactions
      .filter((t) => t.category === category && !t.is_ignored)
      .reduce((acc, t) => acc + parseFloat(t.amount.toString()), 0);
  }, [budgetFilteredTransactions]);

  const incomeBudgets: Budget[] = [];
  const expenseBudgets: Budget[] = [];

  budgets.forEach((budget) => {
    if (ignoredCategories.includes(budget.category)) {
      return;
    }
    const spent = getSpentAmount(budget.category);
    if (spent < 0) {
      incomeBudgets.push(budget);
    } else {
      expenseBudgets.push(budget);
    }
  });

  const totalIncomeAllocated = incomeBudgets.reduce((acc, b) => acc + b.allocated, 0);
  const totalIncomeEarned = incomeBudgets.reduce((acc, b) => acc + getSpentAmount(b.category), 0);
  const totalIncomeRemaining = totalIncomeAllocated + totalIncomeEarned;

  const totalExpenseAllocated = expenseBudgets.reduce((acc, b) => acc + b.allocated, 0);
  const totalExpenseSpent = expenseBudgets.reduce((acc, b) => acc + getSpentAmount(b.category), 0);
  const totalExpenseRemaining = totalExpenseAllocated - totalExpenseSpent;

  return (
    <div className="container mt-4">
      <style>
        {`
          @media print {
            .no-print {
              display: none !important;
            }
          }
        `}
      </style>
      <div className="d-flex justify-content-between align-items-center mb-4">
        <h1>Printable Budgets</h1>
        <button className="btn btn-primary no-print" onClick={() => window.print()}>
          Print
        </button>
      </div>

      <h2>Income</h2>
      <table className="table table-bordered">
        <thead>
          <tr>
            <th>Category</th>
            <th>Allocated</th>
            <th>Earned</th>
            <th>Remaining</th>
          </tr>
        </thead>
        <tbody>
          {incomeBudgets.map((budget) => {
            const earned = getSpentAmount(budget.category);
            const remaining = budget.allocated + earned;
            return (
              <tr key={budget.category}>
                <td>{budget.category}</td>
                <td>{budget.allocated.toFixed(2)}</td>
                <td>{earned.toFixed(2)}</td>
                <td>{remaining.toFixed(2)}</td>
              </tr>
            );
          })}
        </tbody>
        <tfoot>
          <tr>
            <th>Total</th>
            <th>{totalIncomeAllocated.toFixed(2)}</th>
            <th>{totalIncomeEarned.toFixed(2)}</th>
            <th>{totalIncomeRemaining.toFixed(2)}</th>
          </tr>
        </tfoot>
      </table>

      <h2 className="mt-4">Expenses</h2>
      <table className="table table-bordered">
        <thead>
          <tr>
            <th>Category</th>
            <th>Allocated</th>
            <th>Spent</th>
            <th>Remaining</th>
          </tr>
        </thead>
        <tbody>
          {expenseBudgets.map((budget) => {
            const spent = getSpentAmount(budget.category);
            const remaining = budget.allocated - spent;
            return (
              <tr key={budget.category}>
                <td>{budget.category}</td>
                <td>{budget.allocated.toFixed(2)}</td>
                <td>{spent.toFixed(2)}</td>
                <td>{remaining.toFixed(2)}</td>
              </tr>
            );
          })}
        </tbody>
        <tfoot>
          <tr>
            <th>Total</th>
            <th>{totalExpenseAllocated.toFixed(2)}</th>
            <th>{totalExpenseSpent.toFixed(2)}</th>
            <th>{totalExpenseRemaining.toFixed(2)}</th>
          </tr>
        </tfoot>
      </table>
    </div>
  );
};

export default PrintableBudgetsPage;
