import React, { useContext, useState } from 'react';
import { AppContext } from '../context/AppContext';
import type { Budget } from '../context/AppContext';

const IncomeBudgetsTable: React.FC<{ budgets: Budget[] }> = ({ budgets }) => {
  const context = useContext(AppContext);
  const [editCategory, setEditCategory] = useState<string | null>(null);
  const [editAllocated, setEditAllocated] = useState<number>(0);

  const { budgetFilteredTransactions, updateBudgetAllocation, deleteBudget, ignoredCategories, setIgnoredCategories } = context!;

  const handleEditClick = (budget: Budget) => {
    setEditCategory(budget.category);
    setEditAllocated(budget.allocated);
  };

  const handleSaveClick = (category: string) => {
    updateBudgetAllocation(category, editAllocated);
    setEditCategory(null);
    setEditAllocated(0);
  };

  const handleCancelClick = () => {
    setEditCategory(null);
    setEditAllocated(0);
  };

  const handleIgnoreChange = (category: string) => {
    setIgnoredCategories((prev) =>
      prev.includes(category)
        ? prev.filter((c) => c !== category)
        : [...prev, category]
    );
  };

  const getEarnedAmount = (category: string) => {
    return budgetFilteredTransactions
      .filter((t) => t.category === category && !t.is_ignored)
      .reduce((acc, t) => acc + parseFloat(t.amount.toString()), 0);
  };

  const visibleBudgets = budgets.filter(
    (b) => !ignoredCategories.includes(b.category)
  );
  const totalAllocated = visibleBudgets.reduce(
    (acc, budget) => acc + budget.allocated,
    0
  );
  const totalEarned = visibleBudgets.reduce(
    (acc, budget) => acc + getEarnedAmount(budget.category),
    0
  );
  const totalRemaining = totalAllocated + totalEarned; // For income, allocated + earned

  return (
    <table className="table table-dark table-striped">
      <thead>
        <tr>
          <th>Category</th>
          <th>Allocated</th>
          <th>Earned</th>
          <th>Remaining</th>
          <th>Actions</th>
          <th>Ignore</th>
        </tr>
      </thead>
      <tbody>
        {budgets.map((budget) => {
          const earned = getEarnedAmount(budget.category);
          const remaining = budget.allocated + earned; // For income, allocated + earned
          return (
            <tr key={budget.category}>
              <td>{budget.category}</td>
              <td>
                {editCategory === budget.category ? (
                  <input
                    type="number"
                    className="form-control"
                    value={editAllocated}
                    onChange={(e) => setEditAllocated(parseFloat(e.target.value))}
                  />
                ) : (
                  budget.allocated.toFixed(2)
                )}
              </td>
              <td>{earned.toFixed(2)}</td>
              <td className={remaining < 0 ? 'text-danger' : ''}>
                {remaining.toFixed(2)}
              </td>
              <td>
                {editCategory === budget.category ? (
                  <>
                    <button
                      className="btn btn-success btn-sm me-2"
                      onClick={() => handleSaveClick(budget.category)}
                    >
                      Save
                    </button>
                    <button
                      className="btn btn-secondary btn-sm"
                      onClick={handleCancelClick}
                    >
                      Cancel
                    </button>
                  </>
                ) : (
                  <>
                    <button
                      className="btn btn-primary btn-sm"
                      onClick={() => handleEditClick(budget)}
                    >
                      Edit
                    </button>
                    <button
                      className="btn btn-danger btn-sm ms-2"
                      onClick={() => deleteBudget(budget.category)}
                    >
                      Delete
                    </button>
                  </>
                )}
              </td>
              <td>
                <input
                  type="checkbox"
                  checked={ignoredCategories.includes(budget.category)}
                  onChange={() => handleIgnoreChange(budget.category)}
                />
              </td>
            </tr>
          );
        })}
      </tbody>
      <tfoot>
        <tr>
          <th>Total</th>
          <th>{totalAllocated.toFixed(2)}</th>
          <th>{totalEarned.toFixed(2)}</th>
          <th className={totalRemaining < 0 ? 'text-danger' : ''}>
            {totalRemaining.toFixed(2)}
          </th>
          <th></th>
          <th></th>
        </tr>
      </tfoot>
    </table>
  );
};

export default IncomeBudgetsTable;
