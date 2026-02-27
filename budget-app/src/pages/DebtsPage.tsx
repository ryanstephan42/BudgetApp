import React, { useContext, useMemo } from 'react';
import { AppContext } from '../context/AppContext';
import AddDebtForm from '../components/AddDebtForm';
import DebtCard from '../components/DebtCard';

const DebtsPage: React.FC = () => {
  const context = useContext(AppContext);

  if (!context) {
    return <div>Loading...</div>;
  }

  const { debts } = context;

  const totalDebtRemaining = useMemo(() => {
    return debts.reduce((sum, debt) => sum + debt.current_balance, 0);
  }, [debts]);

  return (
    <div>
      <div className="d-flex justify-content-between align-items-center mb-4">
        <h2>Debt Tracking</h2>
        {totalDebtRemaining > 0 && (
          <h4 className="text-danger">Total Debt Remaining: ${totalDebtRemaining.toFixed(2)}</h4>
        )}
      </div>

      <AddDebtForm />

      <hr className="my-4" />

      <h4>Your Debts</h4>
      {debts.length === 0 ? (
        <p>You haven't added any debts yet. Add one above to get started!</p>
      ) : (
        <div className="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
          {debts.map((debt) => (
            <div key={debt.id} className="col">
              <DebtCard debt={debt} />
            </div>
          ))}
        </div>
      )}
    </div>
  );
};

export default DebtsPage;
