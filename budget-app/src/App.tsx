import React from 'react';
import { Routes, Route } from 'react-router-dom';
import TransactionsPage from './pages/TransactionsPage';
import BudgetsPage from './pages/BudgetsPage';
import GroupsPage from './pages/GroupsPage';
import GoalsPage from './pages/GoalsPage';
import ReportsPage from './pages/ReportsPage';
import DebtsPage from './pages/DebtsPage'; // Import the new DebtsPage
import PrintableBudgetsPage from './pages/PrintableBudgetsPage';
import MainLayout from './components/MainLayout';
import './App.css';

const App: React.FC = () => {
  return (
    <Routes>
      <Route path="/" element={<MainLayout><TransactionsPage /></MainLayout>} />
      <Route path="/budgets" element={<MainLayout><BudgetsPage /></MainLayout>} />
      <Route path="/groups" element={<MainLayout><GroupsPage /></MainLayout>} />
      <Route path="/goals" element={<MainLayout><GoalsPage /></MainLayout>} />
      <Route path="/debts" element={<MainLayout><DebtsPage /></MainLayout>} /> {/* Add new route for DebtsPage */}
      <Route path="/reports" element={<MainLayout><ReportsPage /></MainLayout>} />
      <Route path="/print-budgets" element={<PrintableBudgetsPage />} />
    </Routes>
  );
};

export default App;