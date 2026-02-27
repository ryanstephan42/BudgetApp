import React, { useState, useContext } from 'react';
import { AppContext } from '../context/AppContext';

const AddDebtForm: React.FC = () => {
  const context = useContext(AppContext);
  const [name, setName] = useState('');
  const [startingBalance, setStartingBalance] = useState(0);
  const [interestRate, setInterestRate] = useState(0);
  const [minPayment, setMinPayment] = useState(0);
  const [dueDate, setDueDate] = useState(1); // Day of month

  if (!context) {
    return null;
  }

  const { addDebt } = context;

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (name && startingBalance > 0) {
      addDebt({
        name,
        starting_balance: startingBalance,
        current_balance: startingBalance, // Initially current balance is starting balance
        interest_rate: interestRate,
        min_payment: minPayment,
        due_date: dueDate,
      });
      setName('');
      setStartingBalance(0);
      setInterestRate(0);
      setMinPayment(0);
      setDueDate(1);
    }
  };

  return (
    <form onSubmit={handleSubmit} className="mb-4 p-3 border rounded">
      <h4>Add New Debt</h4>
      <div className="row g-3">
        <div className="col-12 col-md-3">
          <label htmlFor="debtName" className="form-label">Debt Name</label>
          <input
            type="text"
            className="form-control"
            id="debtName"
            placeholder="e.g., Car Loan"
            value={name}
            onChange={(e) => setName(e.target.value)}
            required
          />
        </div>
        <div className="col-12 col-md-3">
          <label htmlFor="startingBalance" className="form-label">Starting Balance</label>
          <input
            type="number"
            className="form-control"
            id="startingBalance"
            placeholder="e.g., 25000"
            value={startingBalance}
            onChange={(e) => setStartingBalance(parseFloat(e.target.value))}
            step="0.01"
            required
          />
        </div>
        <div className="col-12 col-md-2">
          <label htmlFor="interestRate" className="form-label">Interest Rate (%)</label>
          <input
            type="number"
            className="form-control"
            id="interestRate"
            placeholder="e.g., 5.5"
            value={interestRate}
            onChange={(e) => setInterestRate(parseFloat(e.target.value))}
            step="0.01"
          />
        </div>
        <div className="col-12 col-md-2">
          <label htmlFor="minPayment" className="form-label">Min Payment</label>
          <input
            type="number"
            className="form-control"
            id="minPayment"
            placeholder="e.g., 300"
            value={minPayment}
            onChange={(e) => setMinPayment(parseFloat(e.target.value))}
            step="0.01"
          />
        </div>
        <div className="col-12 col-md-2">
          <label htmlFor="dueDate" className="form-label">Due Day</label>
          <input
            type="number"
            className="form-control"
            id="dueDate"
            value={dueDate}
            onChange={(e) => setDueDate(parseInt(e.target.value))}
            min="1"
            max="31"
          />
        </div>
        <div className="col-12 d-grid">
          <button type="submit" className="btn btn-primary">
            Add Debt
          </button>
        </div>
      </div>
    </form>
  );
};

export default AddDebtForm;
