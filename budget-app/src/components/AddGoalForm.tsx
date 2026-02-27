import React, { useState, useContext } from 'react';
import { AppContext } from '../context/AppContext';

const AddGoalForm: React.FC = () => {
  const context = useContext(AppContext);
  const [name, setName] = useState('');
  const [targetAmount, setTargetAmount] = useState(0);
  const [targetDate, setTargetDate] = useState('');

  if (!context) {
    return null;
  }

  const { addGoal } = context;

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (name && targetAmount > 0) {
      addGoal({
        name,
        target_amount: targetAmount,
        current_amount: 0,
        target_date: targetDate || undefined,
      });
      setName('');
      setTargetAmount(0);
      setTargetDate('');
    }
  };

  return (
    <form onSubmit={handleSubmit} className="mb-4 p-3 border rounded">
      <h4>Add New Goal</h4>
      <div className="row g-3">
        <div className="col-12 col-md-4">
          <label htmlFor="goalName" className="form-label">Goal Name</label>
          <input
            type="text"
            className="form-control"
            id="goalName"
            placeholder="e.g., New Car"
            value={name}
            onChange={(e) => setName(e.target.value)}
            required
          />
        </div>
        <div className="col-12 col-md-3">
          <label htmlFor="targetAmount" className="form-label">Target Amount</label>
          <input
            type="number"
            className="form-control"
            id="targetAmount"
            placeholder="e.g., 20000"
            value={targetAmount}
            onChange={(e) => setTargetAmount(parseFloat(e.target.value))}
            required
          />
        </div>
        <div className="col-12 col-md-3">
          <label htmlFor="targetDate" className="form-label">Target Date (Optional)</label>
          <input
            type="date"
            className="form-control"
            id="targetDate"
            value={targetDate}
            onChange={(e) => setTargetDate(e.target.value)}
          />
        </div>
        <div className="col-12 col-md-2 d-grid align-self-end">
          <button type="submit" className="btn btn-primary">
            Add Goal
          </button>
        </div>
      </div>
    </form>
  );
};

export default AddGoalForm;
