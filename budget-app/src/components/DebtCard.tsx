import React, { useState, useContext } from 'react';
import { AppContext } from '../context/AppContext';
import type { Debt } from '../services/api'; // Use the Debt interface from api.ts

interface DebtCardProps {
  debt: Debt;
}

const DebtCard: React.FC<DebtCardProps> = ({ debt }) => {
  const context = useContext(AppContext);
  const [isEditing, setIsEditing] = useState(false);
  const [payAmount, setPayAmount] = useState(0);

  if (!context) {
    return null;
  }

  const { updateDebt, deleteDebt } = context;

  // Calculate percentage paid (inverted: 100% means 0 balance)
  const percentagePaid = debt.starting_balance > 0
    ? ((debt.starting_balance - debt.current_balance) / debt.starting_balance) * 100
    : 0;

  // Simple estimated payoff time in months
  const estimatedPayoffMonths = debt.min_payment > 0
    ? debt.current_balance / debt.min_payment
    : Infinity; // If min_payment is 0, it will never be paid off

  const handlePayAmount = () => {
    // Prevent paying more than current balance or negative amounts
    const newBalance = Math.max(0, debt.current_balance - payAmount);
    updateDebt(debt.id, { current_balance: newBalance });
    setPayAmount(0);
  };

  const handleEdit = () => {
    // For simplicity, we'll just allow updating via the card for now.
    // A more complex implementation could use a modal with a full edit form
    setIsEditing(!isEditing);
  };

  return (
    <div className="card h-100">
      <div className="card-body">
        <h5 className="card-title d-flex justify-content-between align-items-center">
          {debt.name}
          <div className="dropdown">
            <button className="btn btn-sm btn-secondary dropdown-toggle" type="button" id={`dropdownMenuButton-debt-${debt.id}`} data-bs-toggle="dropdown" aria-expanded="false">
              Actions
            </button>
            <ul className="dropdown-menu" aria-labelledby={`dropdownMenuButton-debt-${debt.id}`}>
              <li><button className="dropdown-item" onClick={handleEdit}>Edit Debt</button></li>
              <li><button className="dropdown-item text-danger" onClick={() => deleteDebt(debt.id)}>Delete Debt</button></li>
            </ul>
          </div>
        </h5>
        
        <p className="card-text mb-1">
          Interest Rate: {debt.interest_rate.toFixed(2)}%
        </p>
        <p className="card-text mb-1">
          Minimum Payment: ${debt.min_payment.toFixed(2)} (Due Day: {debt.due_date})
        </p>

        <div className="progress mb-2" style={{height: '25px'}}>
          <div
            className="progress-bar bg-success" // Use bg-success to indicate progress
            role="progressbar"
            style={{ width: `${percentagePaid}%` }}
            aria-valuenow={percentagePaid}
            aria-valuemin={0}
            aria-valuemax={100}
          >
            {percentagePaid.toFixed(1)}% Paid
          </div>
        </div>
        
        <p className="text-center mb-1">
          Remaining: <strong>${debt.current_balance.toFixed(2)}</strong> of ${debt.starting_balance.toFixed(2)}
        </p>
        <p className="text-center text-muted small">
          {estimatedPayoffMonths !== Infinity && estimatedPayoffMonths > 0
            ? `Estimated Payoff: ${estimatedPayoffMonths.toFixed(1)} months`
            : estimatedPayoffMonths === 0
              ? 'Paid Off!'
              : 'N/A (No minimum payment)'}
        </p>

        {isEditing && (
          <div className="input-group my-3">
            <input 
              type="number"
              className="form-control"
              value={payAmount}
              onChange={(e) => setPayAmount(parseFloat(e.target.value))}
              placeholder="Amount to pay"
              min="0"
              max={debt.current_balance}
            />
            <button className="btn btn-outline-primary" type="button" onClick={handlePayAmount}>Make Payment</button>
          </div>
        )}
      </div>
    </div>
  );
};

export default DebtCard;
