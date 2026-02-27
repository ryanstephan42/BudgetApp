import React, { useState } from 'react';
import { Link, useLocation } from 'react-router-dom';
import DateFilter from '../components/DateFilter';
import BudgetWarning from './BudgetWarning';

const MainLayout: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  const location = useLocation();
  const page = location.pathname;
  const [isNavOpen, setIsNavOpen] = useState(false);

  return (
    <div className="container-fluid mt-4">
      <nav className="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
        <Link className="navbar-brand d-lg-none" to="/">BudgetApp</Link>
        <button
          className="navbar-toggler"
          type="button"
          onClick={() => setIsNavOpen(!isNavOpen)}
          aria-controls="navbarNav"
          aria-expanded={isNavOpen ? 'true' : 'false'}
          aria-label="Toggle navigation"
        >
          <span className="navbar-toggler-icon"></span>
        </button>
        <div className={`collapse navbar-collapse ${isNavOpen ? 'show' : ''}`} id="navbarNav">
          <ul className="navbar-nav mr-auto">
            <li className="nav-item">
              <Link
                to="/"
                className={`nav-link ${page === '/' ? 'active' : ''}`}
                onClick={() => setIsNavOpen(false)} // Close nav on link click
              >
                Transactions
              </Link>
            </li>
            <li className="nav-item">
              <Link
                to="/budgets"
                className={`nav-link ${page === '/budgets' ? 'active' : ''}`}
                onClick={() => setIsNavOpen(false)} // Close nav on link click
              >
                Budgets
              </Link>
            </li>
            <li className="nav-item">
              <Link
                to="/groups"
                className={`nav-link ${page === '/groups' ? 'active' : ''}`}
                onClick={() => setIsNavOpen(false)} // Close nav on link click
              >
                Groups
              </Link>
            </li>
            <li className="nav-item">
              <Link
                to="/goals"
                className={`nav-link ${page === '/goals' ? 'active' : ''}`}
                onClick={() => setIsNavOpen(false)} // Close nav on link click
              >
                Goals
              </Link>
            </li>
            <li className="nav-item">
              <Link
                to="/debts"
                className={`nav-link ${page === '/debts' ? 'active' : ''}`}
                onClick={() => setIsNavOpen(false)} // Close nav on link click
              >
                Debts
              </Link>
            </li>
            <li className="nav-item">
              <Link
                to="/reports"
                className={`nav-link ${page === '/reports' ? 'active' : ''}`}
                onClick={() => setIsNavOpen(false)} // Close nav on link click
              >
                Reports
              </Link>
            </li>
          </ul>
        </div>
      </nav>
      <BudgetWarning />
      <DateFilter />
      {children}
    </div>
  );
};

export default MainLayout;
