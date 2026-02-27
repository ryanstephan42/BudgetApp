import React, { useContext, useState, useEffect } from 'react';
import { AppContext } from '../context/AppContext';

const BudgetWarning: React.FC = () => {
  const context = useContext(AppContext);
  const [snoozed, setSnoozed] = useState(false);
  const [dismissedMonth, setDismissedMonth] = useState<string | null>(null);

  useEffect(() => {
    const savedDismissedMonth = localStorage.getItem('budget_warning_dismissed_month');
    if (savedDismissedMonth) {
      setDismissedMonth(savedDismissedMonth);
    }
  }, []);

  if (!context) return null;

  const { budgetFilteredTransactions, budgets, ignoredCategories } = context;
  const currentMonth = new Date().toISOString().slice(0, 7); // YYYY-MM

  if (snoozed || dismissedMonth === currentMonth) {
    return null;
  }

  const warnings = budgets
    .filter(b => b.allocated > 0 && !ignoredCategories.includes(b.category))
    .map(b => {
      const spent = budgetFilteredTransactions
        .filter(t => t.category === b.category && !t.is_ignored)
        .reduce((sum, t) => sum + Math.abs(t.amount), 0);
      
      const percent = (spent / b.allocated) * 100;
      return { category: b.category, spent, allocated: b.allocated, percent };
    })
    .filter(w => w.percent >= 75);

  if (warnings.length === 0) {
    return null;
  }

  const handleSnooze = () => {
    setSnoozed(true);
  };

  const handleDismiss = () => {
    localStorage.setItem('budget_warning_dismissed_month', currentMonth);
    setDismissedMonth(currentMonth);
  };

  return (
    <div className="alert alert-warning alert-dismissible fade show" role="alert">
      <strong>Budget Warning!</strong> You have spent 75% or more of your budget in the following categories:
      <ul className="mb-2">
        {warnings.map(w => (
          <li key={w.category}>
            {w.category}: ${w.spent.toFixed(2)} / ${w.allocated.toFixed(2)} ({w.percent.toFixed(1)}%)
          </li>
        ))}
      </ul>
      <div className="d-flex gap-2">
        <button type="button" className="btn btn-sm btn-outline-secondary" onClick={handleSnooze}>
          Snooze (this session)
        </button>
        <button type="button" className="btn btn-sm btn-outline-dark" onClick={handleDismiss}>
          Dismiss for this month
        </button>
      </div>
    </div>
  );
};

export default BudgetWarning;
