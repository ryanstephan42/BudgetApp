import React, { useContext, useMemo } from 'react';
import { AppContext } from '../context/AppContext';
import {
  calculateCategoryBreakdown,
  calculateBudgetVsActual,
  calculateMonthlyCashFlow,
} from '../utils/analyticsHelpers';

// Import Chart Components
import SpendingPieChart from '../components/charts/SpendingPieChart';
import BudgetVsActualChart from '../components/charts/BudgetVsActualChart';
import CashFlowTrendChart from '../components/charts/CashFlowTrendChart';

const ReportsPage: React.FC = () => {
  const context = useContext(AppContext);

  if (!context) {
    return <div>Loading reports...</div>;
  }

  const { transactions, budgetFilteredTransactions, budgets } = context;

  // Use useMemo to re-calculate data only when dependencies change
  const categoryBreakdownData = useMemo(() => calculateCategoryBreakdown(budgetFilteredTransactions), [budgetFilteredTransactions]);
  const budgetVsActualData = useMemo(() => calculateBudgetVsActual(budgetFilteredTransactions, budgets), [budgetFilteredTransactions, budgets]);
  const monthlyCashFlowData = useMemo(() => calculateMonthlyCashFlow(transactions), [transactions]); // Use all transactions for trend

  return (
    <div className="reports-page">
      <h2 className="mb-4">Financial Reports</h2>

      <div className="row">
        <div className="col-12 col-lg-6 mb-4">
          <div className="card">
            <div className="card-header">Spending Breakdown by Category</div>
            <div className="card-body">
              <SpendingPieChart data={categoryBreakdownData} />
            </div>
          </div>
        </div>
        <div className="col-12 col-lg-6 mb-4">
          <div className="card">
            <div className="card-header">Budget vs. Actual Spending</div>
            <div className="card-body">
              <BudgetVsActualChart data={budgetVsActualData} />
            </div>
          </div>
        </div>
        <div className="col-12 mb-4">
          <div className="card">
            <div className="card-header">Monthly Cash Flow Trend</div>
            <div className="card-body">
              <CashFlowTrendChart data={monthlyCashFlowData} />
            </div>
          </div>
        </div>
        {/* Additional charts can be added here */}
      </div>
    </div>
  );
};

export default ReportsPage;
