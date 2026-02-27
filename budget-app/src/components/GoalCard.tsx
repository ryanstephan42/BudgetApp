import React, { useState, useContext } from 'react';
import { AppContext } from '../context/AppContext';
import type { Goal } from '../context/AppContext';

interface GoalCardProps {
  goal: Goal;
}

const GoalCard: React.FC<GoalCardProps> = ({ goal }) => {
  const context = useContext(AppContext);
  const [isEditing, setIsEditing] = useState(false);
  const [fundAmount, setFundAmount] = useState(0);

  if (!context) {
    return null;
  }

  const { updateGoal, deleteGoal } = context;

  const percentage = goal.target_amount > 0 ? (goal.current_amount / goal.target_amount) * 100 : 0;

  const handleAddFunds = () => {
    const newAmount = Math.max(0, goal.current_amount + fundAmount);
    updateGoal(goal.id, { current_amount: newAmount });
    setFundAmount(0);
  };
  
  const handleEdit = () => {
    // For simplicity, we'll just allow updating the current amount for now
    // A more complex implementation could use a modal with a full edit form
    setIsEditing(!isEditing);
  }

  return (
    <div className="card h-100">
      <div className="card-body">
        <h5 className="card-title d-flex justify-content-between align-items-center">
          {goal.name}
          <div className="dropdown">
            <button className="btn btn-sm btn-secondary dropdown-toggle" type="button" id={`dropdownMenuButton-${goal.id}`} data-bs-toggle="dropdown" aria-expanded="false">
              Actions
            </button>
            <ul className="dropdown-menu" aria-labelledby={`dropdownMenuButton-${goal.id}`}>
              <li><button className="dropdown-item" onClick={handleEdit}>Edit Goal</button></li>
              <li><button className="dropdown-item text-danger" onClick={() => deleteGoal(goal.id)}>Delete Goal</button></li>
            </ul>
          </div>
        </h5>
        
        <p className="card-text">
          Target: ${goal.target_amount.toFixed(2)}
          {goal.target_date && ` by ${new Date(goal.target_date).toLocaleDateString()}`}
        </p>

        <div className="progress mb-2" style={{height: '25px'}}>
          <div
            className="progress-bar"
            role="progressbar"
            style={{ width: `${percentage}%` }}
            aria-valuenow={percentage}
            aria-valuemin={0}
            aria-valuemax={100}
          >
            {percentage.toFixed(1)}%
          </div>
        </div>
        
        <p className="text-center">
          Saved: <strong>${goal.current_amount.toFixed(2)}</strong>
        </p>

        {isEditing && (
          <div className="input-group my-3">
            <input 
              type="number"
              className="form-control"
              value={fundAmount}
              onChange={(e) => setFundAmount(parseFloat(e.target.value))}
              placeholder="Amount to add/remove"
            />
            <button className="btn btn-outline-primary" type="button" onClick={handleAddFunds}>Update Funds</button>
          </div>
        )}
      </div>
    </div>
  );
};

export default GoalCard;
