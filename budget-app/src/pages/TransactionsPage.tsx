import React, { useContext } from 'react';
import FileUploader from '../components/FileUpload';
import AddTransactionForm from '../components/AddTransactionForm'; // Import the new component
import TransactionsTable from '../components/TransactionsTable';
import { AppContext } from '../context/AppContext';
import SearchableDropdown from '../components/SearchableDropdown';

const TransactionsPage: React.FC = () => {
  const context = useContext(AppContext);

  if (!context) {
    return null;
  }

  const {
    textFilter,
    setTextFilter,
    categoryFilter,
    setCategoryFilter,
    groupFilter,
    setGroupFilter,
    budgets,
    groups,
    currentPage,
    setCurrentPage,
    rowsPerPage,
    setRowsPerPage,
    tableFilteredTransactions,
  } = context;

  const categoryOptions = [
    { value: '', label: 'All Categories' },
    ...budgets.map((budget) => ({
      value: budget.category,
      label: budget.category,
    })),
  ];

  const groupOptions = [
    { value: '', label: 'All Groups' },
    ...groups.map((group) => ({
      value: group.id,
      label: group.name,
    })),
  ];

  const totalPages = Math.ceil(tableFilteredTransactions.length / rowsPerPage);

  return (
    <div>
      <h1>Transactions</h1>
      <FileUploader />
      <AddTransactionForm /> {/* Add the new form here */}
      <div className="row mb-3">
        <div className="col-md-4">
          <input
            type="text"
            className="form-control"
            placeholder="Search by description..."
            value={textFilter}
            onChange={(e) => setTextFilter(e.target.value)}
          />
        </div>
        <div className="col-md-4">
          <SearchableDropdown
            options={categoryOptions}
            value={categoryOptions.find((option) => option.value === categoryFilter)}
            onChange={(selectedOption) =>
              setCategoryFilter(selectedOption ? selectedOption.value : '')
            }
          />
        </div>
        <div className="col-md-4">
          <SearchableDropdown
            options={groupOptions}
            value={groupOptions.find((option) => option.value === groupFilter[0])} // Assuming single selection for now
            onChange={(selectedOption) =>
              setGroupFilter(selectedOption ? [selectedOption.value] : [])
            }
          />
        </div>
      </div>
      <div className="d-flex justify-content-between align-items-center mb-3">
        <div className="d-flex align-items-center">
          <label htmlFor="rowsPerPage" className="me-2">Rows per page:</label>
          <select
            id="rowsPerPage"
            className="form-select w-auto"
            value={rowsPerPage}
            onChange={(e) => setRowsPerPage(parseInt(e.target.value))}
          >
            <option value={10}>10</option>
            <option value={25}>25</option>
            <option value={100}>100</option>
          </select>
        </div>
        <nav>
          <ul className="pagination mb-0">
            <li className={`page-item ${currentPage === 1 ? 'disabled' : ''}`}>
              <button className="page-link" onClick={() => setCurrentPage(currentPage - 1)}>
                Previous
              </button>
            </li>
            <li className="page-item disabled">
              <span className="page-link">
                Page {currentPage} of {totalPages}
              </span>
            </li>
            <li className={`page-item ${currentPage === totalPages ? 'disabled' : ''}`}>
              <button className="page-link" onClick={() => setCurrentPage(currentPage + 1)}>
                Next
              </button>
            </li>
          </ul>
        </nav>
      </div>
      <TransactionsTable />
    </div>
  );
};

export default TransactionsPage;
