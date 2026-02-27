import React, { useState, useContext, useEffect, useMemo } from 'react';
import { AppContext } from '../context/AppContext';
import type { Transaction } from '../services/api';
import SearchableDropdown from './SearchableDropdown';

const AddTransactionForm: React.FC = () => {
  const context = useContext(AppContext);
  const [isCollapsed, setIsCollapsed] = useState(true); // Default to collapsed

  if (!context) {
    return null;
  }

  const { addTransactions, budgets, groups, debts } = context;

  const [date, setDate] = useState('');
  const [description, setDescription] = useState('');
  const [amount, setAmount] = useState('');
  const [category, setCategory] = useState('Uncategorized');
  const [groupId, setGroupId] = useState<string | null>(null);
  const [debtId, setDebtId] = useState<string | null>(null);

  // Set default date to today
  useEffect(() => {
    const today = new Date();
    setDate(today.toISOString().split('T')[0]);
  }, []);

  const categoryOptions = useMemo(() => budgets.map((b) => ({
    value: b.category,
    label: b.category,
  })), [budgets]);

  const groupOptions = useMemo(() => [
    { value: '', label: 'No Group' },
    ...groups.map((g) => ({
      value: g.id,
      label: g.name,
    })),
  ], [groups]);

  const debtOptions = useMemo(() => [
    { value: '', label: 'No Debt' },
    ...debts.map((d) => ({
      value: d.id,
      label: d.name,
    })),
  ], [debts]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    if (!date || !description || !amount) {
      alert('Please fill in date, description, and amount.');
      return;
    }

    const newTransaction: Omit<Transaction, 'id'> = {
      date,
      description,
      amount: parseFloat(amount),
      category: category === '' ? 'Uncategorized' : category,
      group_id: groupId === '' ? null : groupId,
      is_ignored: false,
      raw_data: {},
      is_split: false,
      split_details: null,
      debt_id: debtId === '' ? null : debtId,
    };

    await addTransactions([newTransaction]);

    // Clear form
    setDescription('');
    setAmount('');
    setCategory('Uncategorized');
    setGroupId(null);
    setDebtId(null);
    setIsCollapsed(true); // Collapse after successful submission
  };

  return (
    <div className="card bg-secondary p-3 mb-3">
      <div className="d-flex justify-content-between align-items-center">
        <h5 className="card-title">Add New Transaction</h5>
        <button
          className="btn btn-sm btn-outline-light"
          type="button"
          onClick={() => setIsCollapsed(!isCollapsed)}
          aria-expanded={!isCollapsed}
          aria-controls="addTransactionFormCollapse"
        >
          {isCollapsed ? 'Show Form' : 'Hide Form'}
        </button>
      </div>
      <div className={`collapse ${!isCollapsed ? 'show' : ''}`} id="addTransactionFormCollapse">
        <form onSubmit={handleSubmit}>
          <div className="row g-3 mt-3">
            <div className="col-md-3">
              <label htmlFor="transactionDate" className="form-label">Date</label>
              <input
                type="date"
                className="form-control"
                id="transactionDate"
                value={date}
                onChange={(e) => setDate(e.target.value)}
                required
              />
            </div>
            <div className="col-md-5">
              <label htmlFor="transactionDescription" className="form-label">Description</label>
              <input
                type="text"
                className="form-control"
                id="transactionDescription"
                value={description}
                onChange={(e) => setDescription(e.target.value)}
                required
              />
            </div>
            <div className="col-md-4">
              <label htmlFor="transactionAmount" className="form-label">Amount</label>
              <input
                type="number"
                className="form-control"
                id="transactionAmount"
                value={amount}
                onChange={(e) => setAmount(e.target.value)}
                step="0.01"
                required
              />
            </div>
            <div className="col-md-4">
              <label htmlFor="transactionCategory" className="form-label">Category</label>
              <SearchableDropdown
                options={categoryOptions}
                value={categoryOptions.find((option) => option.value === category)}
                onChange={(selectedOption) =>
                  setCategory(selectedOption ? selectedOption.value : '')
                }
              />
            </div>
            <div className="col-md-4">
              <label htmlFor="transactionGroup" className="form-label">Group (Optional)</label>
              <SearchableDropdown
                options={groupOptions}
                value={groupOptions.find((option) => option.value === groupId)}
                onChange={(selectedOption) =>
                  setGroupId(selectedOption ? selectedOption.value : null)
                }
              />
            </div>
            <div className="col-md-4">
              <label htmlFor="transactionDebt" className="form-label">Link to Debt (Optional)</label>
              <SearchableDropdown
                options={debtOptions}
                value={debtOptions.find((option) => option.value === debtId)}
                onChange={(selectedOption) =>
                  setDebtId(selectedOption ? selectedOption.value : null)
                }
              />
            </div>
            <div className="col-12">
              <button type="submit" className="btn btn-primary">Add Transaction</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  );
};

export default AddTransactionForm;
