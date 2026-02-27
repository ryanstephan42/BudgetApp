import React, { useContext, useCallback } from 'react';
import { Link } from 'react-router-dom';
import { AppContext } from '../context/AppContext';
import AddCategoryForm from '../components/AddCategoryForm';
import ExpenseBudgetsTable from '../components/ExpenseBudgetsTable';
import IncomeBudgetsTable from '../components/IncomeBudgetsTable';
import type { Budget } from '../context/AppContext';

const BudgetsPage: React.FC = () => {
  const context = useContext(AppContext);

  const { budgets, budgetFilteredTransactions } = context!;

  const getSpentAmount = useCallback((category: string) => {
    return budgetFilteredTransactions
      .filter((t) => t.category === category && !t.is_ignored)
      .reduce((acc, t) => acc + parseFloat(t.amount.toString()), 0);
  }, [budgetFilteredTransactions]);

  const incomeBudgets: Budget[] = [];
  const expenseBudgets: Budget[] = [];

  budgets.forEach((budget) => {
    const spent = getSpentAmount(budget.category);
    // Assuming income categories have a negative spent amount (money coming in)
    // Or, if allocated is negative, it's an income goal.
    // For now, let's use the spent amount as the primary indicator for splitting.
    // If spent is negative, it's income. If spent is positive, it's expense.
    if (spent < 0) {
      incomeBudgets.push(budget);
    } else {
      expenseBudgets.push(budget);
    }
  });

  return (
    <div className="container mt-4">
      <div className="d-flex justify-content-between align-items-center mb-4">
        <h1>Budgets</h1>
        <Link to="/print-budgets" className="btn btn-secondary">
          Print View
        </Link>
      </div>
      <div className="row mt-4">
        <div className="col-md-12">
          <h2>Income</h2>
          {incomeBudgets.length > 0 ? (
            <IncomeBudgetsTable budgets={incomeBudgets} />
          ) : (
            <p>No income budgets to display.</p>
          )}
        </div>
      </div>
      <div className="row mt-4">
        <div className="col-md-12">
          <h2>Expenses</h2>
          {expenseBudgets.length > 0 ? (
            <ExpenseBudgetsTable budgets={expenseBudgets} />
          ) : (
            <p>No expense budgets to display.</p>
          )}
        </div>
      </div>
      <div className="row mt-4">
        <div className="col-md-6">
          <AddCategoryForm />
        </div>
        <div className="col-md-6">
          <div className="card p-3">
            <h3>Warning Settings</h3>
            <p className="text-muted small">Select categories to ignore for the 75% budget usage warning.</p>
            <div className="d-flex flex-wrap gap-2">
              {budgets.map(b => (
                <div key={b.category} className="form-check">
                  <input
                    className="form-check-input"
                    type="checkbox"
                    id={`ignore-${b.category}`}
                    checked={context?.ignoredCategories.includes(b.category)}
                    onChange={(e) => {
                      if (e.target.checked) {
                        context?.setIgnoredCategories([...context.ignoredCategories, b.category]);
                      } else {
                        context?.setIgnoredCategories(context.ignoredCategories.filter(c => c !== b.category));
                      }
                    }}
                  />
                  <label className="form-check-label" htmlFor={`ignore-${b.category}`}>
                    {b.category}
                  </label>
                </div>
              ))}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default BudgetsPage;