import React, { useContext } from 'react';
import { AppContext } from '../context/AppContext';
import AddGoalForm from '../components/AddGoalForm';
import GoalCard from '../components/GoalCard';

const GoalsPage: React.FC = () => {
  const context = useContext(AppContext);

  if (!context) {
    return <div>Loading...</div>;
  }

  const { goals } = context;

  return (
    <div>
      <div className="d-flex justify-content-between align-items-center mb-4">
        <h2>Financial Goals</h2>
      </div>

      <AddGoalForm />

      <hr className="my-4" />

      <h4>Your Goals</h4>
      {goals.length === 0 ? (
        <p>You haven't set any goals yet. Add one above to get started!</p>
      ) : (
        <div className="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
          {goals.map((goal) => (
            <div key={goal.id} className="col">
              <GoalCard goal={goal} />
            </div>
          ))}
        </div>
      )}
    </div>
  );
};

export default GoalsPage;
