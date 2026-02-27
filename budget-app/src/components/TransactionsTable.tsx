import React, { useContext, useState, useMemo, useCallback, useEffect, useRef } from 'react';
import { AppContext } from '../context/AppContext';
import type { Transaction } from '../context/AppContext';
import SearchableDropdown from './SearchableDropdown';
import SplitTransactionModal from './SplitTransactionModal';

const TransactionsTable: React.FC = React.memo(() => {
  const context = useContext(AppContext)!; // Assert context exists as parent checks it
  const [editTransactionId, setEditTransactionId] = useState<string | null>(null);
  const [editType, setEditType] = useState<'category' | 'group' | 'debt' | null>(null); // Added 'debt'
  const [selectedTransactions, setSelectedTransactions] = useState<string[]>([]);
  const [bulkCategory, setBulkCategory] = useState<string>('');
  const [bulkGroup, setBulkGroup] = useState<string>('');
  const [bulkDebt, setBulkDebt] = useState<string>(''); // Added for bulk debt
  const [sortConfig, setSortConfig] = useState<{ key: keyof Transaction; direction: 'ascending' | 'descending' } | null>(null);
  const [isMobile, setIsMobile] = useState(window.innerWidth < 768);

  // Split Modal State
  const [isSplitModalOpen, setIsSplitModalOpen] = useState(false);
  const [selectedTransactionForSplit, setSelectedTransactionForSplit] = useState<Transaction | null>(null);

  // File Upload State
  const fileInputRef = useRef<HTMLInputElement>(null);
  const [uploadingTransactionId, setUploadingTransactionId] = useState<string | null>(null);

  useEffect(() => {
    const handleResize = () => {
      setIsMobile(window.innerWidth < 768);
    };

    window.addEventListener('resize', handleResize);
    return () => {
      window.removeEventListener('resize', handleResize);
    };
  }, []);

  const {
    tableFilteredTransactions,
    budgets,
    groups,
    debts, // Added debts from context
    updateTransactionCategory,
    updateTransactionGroup,
    updateTransactionDebt, // Added updateTransactionDebt
    ignoreTransaction,
    bulkUpdateTransactionCategory,
    bulkUpdateTransactionGroup,
    bulkUpdateTransactionDebt, // Added bulkUpdateTransactionDebt
    currentPage,
    rowsPerPage,
    updateTransaction,
  } = context;

  const sortedTransactions = useMemo(() => {
    let sortableItems = [...tableFilteredTransactions];
    if (sortConfig !== null) {
      sortableItems.sort((a, b) => {
        const valA = a[sortConfig.key];
        const valB = b[sortConfig.key];
        if (valA === null) return 1;
        if (valB === null) return -1;
        if (valA < valB) {
          return sortConfig.direction === 'ascending' ? -1 : 1;
        }
        if (valA > valB) {
          return sortConfig.direction === 'ascending' ? 1 : -1;
        }
        return 0;
      });
    }
    return sortableItems;
  }, [tableFilteredTransactions, sortConfig]);

  const paginatedAndSortedTransactions = useMemo(() => {
    const startIndex = (currentPage - 1) * rowsPerPage;
    return sortedTransactions.slice(startIndex, startIndex + rowsPerPage);
  }, [sortedTransactions, currentPage, rowsPerPage]);

  const requestSort = useCallback((key: keyof Transaction) => {
    let direction: 'ascending' | 'descending' = 'ascending';
    if (sortConfig && sortConfig.key === key && sortConfig.direction === 'ascending') {
      direction = 'descending';
    }
    setSortConfig({ key, direction });
  }, [sortConfig]);

  const handleEditClick = (transactionId: string, type: 'category' | 'group' | 'debt') => { // Updated type
    setEditTransactionId(transactionId);
    setEditType(type);
  };

  const handleCategoryChange = useCallback((transactionId: string, category: string) => {
    updateTransactionCategory(transactionId, category);
    setEditTransactionId(null);
    setEditType(null);
  }, [updateTransactionCategory]);

  const handleGroupChange = useCallback((transactionId: string, group_id: string | null) => {
    updateTransactionGroup(transactionId, group_id);
    setEditTransactionId(null);
    setEditType(null);
  }, [updateTransactionGroup]);

  const handleDebtChange = useCallback((transactionId: string, debt_id: string | null) => { // New handler
    updateTransactionDebt(transactionId, debt_id);
    setEditTransactionId(null);
    setEditType(null);
  }, [updateTransactionDebt]);

  const handleSelectTransaction = useCallback((transactionId: string) => {
    setSelectedTransactions(prevSelected => 
      prevSelected.includes(transactionId)
        ? prevSelected.filter((id) => id !== transactionId)
        : [...prevSelected, transactionId]
    );
  }, []);

  const handleSelectAll = useCallback(() => {
    const currentPageIds = paginatedAndSortedTransactions.map((t) => t.id);
    const allSelectedOnPage = currentPageIds.every(id => selectedTransactions.includes(id));

    if (allSelectedOnPage) {
      setSelectedTransactions(prev => prev.filter(id => !currentPageIds.includes(id)));
    } else {
      setSelectedTransactions(prev => [...new Set([...prev, ...currentPageIds])]);
    }
  }, [selectedTransactions, paginatedAndSortedTransactions]);

  const handleBulkCategoryChange = useCallback(() => {
    if (bulkCategory && selectedTransactions.length > 0) {
      bulkUpdateTransactionCategory(selectedTransactions, bulkCategory);
      setSelectedTransactions([]);
    }
  }, [bulkCategory, selectedTransactions, bulkUpdateTransactionCategory]);

  const handleBulkGroupChange = useCallback(() => {
    if (selectedTransactions.length > 0) {
      bulkUpdateTransactionGroup(selectedTransactions, bulkGroup || null);
      setSelectedTransactions([]);
    }
  }, [bulkGroup, selectedTransactions, bulkUpdateTransactionGroup]);

  const handleBulkDebtChange = useCallback(() => { // New bulk handler
    if (selectedTransactions.length > 0) {
      bulkUpdateTransactionDebt(selectedTransactions, bulkDebt || null);
      setSelectedTransactions([]);
    }
  }, [bulkDebt, selectedTransactions, bulkUpdateTransactionDebt]);

  // --- Split Transaction Logic ---
  const handleSplitClick = (transaction: Transaction) => {
    setSelectedTransactionForSplit(transaction);
    setIsSplitModalOpen(true);
  };

  const handleSaveSplits = async (transactionId: string, splits: any[]) => {
    await updateTransaction(transactionId, { splits: splits });
    // The context updateTransaction will refresh the list
  };

  // --- File Upload Logic ---
  const handleUploadClick = (transactionId: string) => {
    setUploadingTransactionId(transactionId);
    if (fileInputRef.current) {
      fileInputRef.current.click();
    }
  };

  const handleFileChange = async (event: React.ChangeEvent<HTMLInputElement>) => {
    const file = event.target.files?.[0];
    if (file && uploadingTransactionId) {
      await updateTransaction(uploadingTransactionId, { file: file });
      setUploadingTransactionId(null);
      // Reset file input
      if (fileInputRef.current) fileInputRef.current.value = '';
    }
  };

  const getReceiptUrl = (path: string) => {
      if (!path) return '';
      if (path.startsWith('http')) return path;
      // Assuming backend runs on port 5500 based on api.ts info, but we should probably make this configurable
      // API_BASE_URL is http://100.89.162.63:5500/api
      // So base is http://100.89.162.63:5500
      const baseUrl = 'http://100.89.162.63:5500';
      return `${baseUrl}${path}`;
  };

  const categoryOptions = useMemo(() => budgets.map((budget) => ({
    value: budget.category,
    label: budget.category,
  })), [budgets]);

  const groupOptions = useMemo(() => [
    { value: '', label: 'No Group' },
    ...groups.map((group) => ({
      value: group.id,
      label: group.name,
    }))
  ], [groups]);

  const debtOptions = useMemo(() => [ // New debt options
    { value: '', label: 'No Debt' },
    ...debts.map((debt) => ({
      value: debt.id,
      label: debt.name,
    }))
  ], [debts]);

  const areAllOnPageSelected = useMemo(() => {
    const currentPageIds = paginatedAndSortedTransactions.map(t => t.id);
    return currentPageIds.length > 0 && currentPageIds.every(id => selectedTransactions.includes(id));
  }, [selectedTransactions, paginatedAndSortedTransactions]);

  return (
    <>
      {/* Hidden File Input */}
      <input
        type="file"
        ref={fileInputRef}
        style={{ display: 'none' }}
        onChange={handleFileChange}
        accept="image/*,application/pdf"
      />

      {/* Split Transaction Modal */}
      <SplitTransactionModal
        key={selectedTransactionForSplit?.id || 'empty'}
        show={isSplitModalOpen}
        onClose={() => setIsSplitModalOpen(false)}
        onSave={handleSaveSplits}
        transaction={selectedTransactionForSplit}
        categories={categoryOptions.map(c => c.value)}
      />

      {!isMobile && (
        <div className="row mb-3">
          <div className="col-md-3">
            <SearchableDropdown
              options={categoryOptions}
              value={categoryOptions.find((option) => option.value === bulkCategory)}
              onChange={(selectedOption) =>
                setBulkCategory(selectedOption ? selectedOption.value : '')
              }
            />
          </div>
          <div className="col-md-3">
            <button
              className="btn btn-primary w-100"
              onClick={handleBulkCategoryChange}
              disabled={!bulkCategory || selectedTransactions.length === 0}
            >
              Change Category ({selectedTransactions.length})
            </button>
          </div>
          <div className="col-md-3">
            <SearchableDropdown
              options={groupOptions}
              value={groupOptions.find((option) => option.value === bulkGroup)}
              onChange={(selectedOption) =>
                setBulkGroup(selectedOption ? selectedOption.value : '')
              }
            />
          </div>
          <div className="col-md-3">
            <button
              className="btn btn-info w-100"
              onClick={handleBulkGroupChange}
              disabled={selectedTransactions.length === 0}
            >
              Assign Group ({selectedTransactions.length})
            </button>
          </div>
          {/* New Bulk Debt Assignment */}
          <div className="col-md-3 mt-2">
            <SearchableDropdown
              options={debtOptions}
              value={debtOptions.find((option) => option.value === bulkDebt)}
              onChange={(selectedOption) =>
                setBulkDebt(selectedOption ? selectedOption.value : '')
              }
            />
          </div>
          <div className="col-md-3 mt-2">
            <button
              className="btn btn-success w-100"
              onClick={handleBulkDebtChange}
              disabled={selectedTransactions.length === 0}
            >
              Assign Debt ({selectedTransactions.length})
            </button>
          </div>
        </div>
      )}

      {isMobile ? (
        <div className="d-flex flex-column gap-3">
          {paginatedAndSortedTransactions.map((transaction) => {
            const groupName = transaction.group_id
              ? groups.find((g) => g.id === transaction.group_id)?.name || 'Unknown Group'
              : 'No Group';
            const debtName = transaction.debt_id
              ? debts.find((d) => d.id === transaction.debt_id)?.name || 'Unknown Debt'
              : 'No Debt';
            return (
              <div key={transaction.id} className="card">
                <div className="card-body">
                  <h5 className="card-title">{transaction.description}</h5>
                  <h6 className="card-subtitle mb-2 text-muted">{transaction.date}</h6>
                  <p className="card-text">
                    <strong>Amount:</strong> {transaction.amount}
                  </p>
                  {/* Mobile Actions */}
                  <div className="mb-2">
                    <button className="btn btn-sm btn-outline-primary me-2" onClick={() => handleSplitClick(transaction)}>
                      Split
                    </button>
                    <button className="btn btn-sm btn-outline-secondary me-2" onClick={() => handleUploadClick(transaction.id)}>
                      {transaction.receipt_url ? 'Update Receipt' : 'Add Receipt'}
                    </button>
                     {transaction.receipt_url && (
                        <a href={getReceiptUrl(transaction.receipt_url)} target="_blank" rel="noreferrer" className="btn btn-sm btn-link">View Receipt</a>
                     )}
                  </div>

                  <p className="card-text">
                    <strong>Category:</strong>{' '}
                    {editTransactionId === transaction.id && editType === 'category' ? (
                      <SearchableDropdown
                        options={categoryOptions}
                        value={categoryOptions.find(
                          (option) => option.value === transaction.category
                        )}
                        onChange={(selectedOption) =>
                          handleCategoryChange(
                            transaction.id,
                            selectedOption ? selectedOption.value : ''
                          )
                        }
                      />
                    ) : (
                      <span onClick={() => handleEditClick(transaction.id, 'category')}>
                        {transaction.category}
                      </span>
                    )}
                  </p>
                  {/* ... rest of mobile view ... */}
                  <p className="card-text">
                    <strong>Group:</strong>{' '}
                    {editTransactionId === transaction.id && editType === 'group' ? (
                      <SearchableDropdown
                        options={groupOptions}
                        value={groupOptions.find(
                          (option) => option.value === transaction.group_id
                        )}
                        onChange={(selectedOption) =>
                          handleGroupChange(
                            transaction.id,
                            selectedOption ? selectedOption.value : null
                          )
                        }
                      />
                    ) : (
                      <span onClick={() => handleEditClick(transaction.id, 'group')}>
                        {groupName}
                      </span>
                    )}
                  </p>
                  {/* New Debt assignment for mobile */}
                  <p className="card-text">
                    <strong>Debt:</strong>{' '}
                    {editTransactionId === transaction.id && editType === 'debt' ? (
                      <SearchableDropdown
                        options={debtOptions}
                        value={debtOptions.find(
                          (option) => option.value === transaction.debt_id
                        )}
                        onChange={(selectedOption) =>
                          handleDebtChange(
                            transaction.id,
                            selectedOption ? selectedOption.value : null
                          )
                        }
                      />
                    ) : (
                      <span onClick={() => handleEditClick(transaction.id, 'debt')}>
                        {debtName}
                      </span>
                    )}
                  </p>
                  <div className="d-flex justify-content-between align-items-center">
                    <button
                      className="btn btn-secondary btn-sm"
                      onClick={() => ignoreTransaction(transaction.id)}
                    >
                      {transaction.is_ignored ? 'Unignore' : 'Ignore'}
                    </button>
                    <div className="form-check">
                      <input
                        className="form-check-input"
                        type="checkbox"
                        checked={selectedTransactions.includes(transaction.id)}
                        onChange={() => handleSelectTransaction(transaction.id)}
                        id={`mobile-checkbox-${transaction.id}`}
                      />
                      <label className="form-check-label" htmlFor={`mobile-checkbox-${transaction.id}`}>
                        Select
                      </label>
                    </div>
                  </div>
                </div>
              </div>
            );
          })}
        </div>
      ) : (
        <table className="table table-dark table-striped">
          <thead>
            <tr>
              <th>
                <input
                  type="checkbox"
                  onChange={handleSelectAll}
                  checked={areAllOnPageSelected}
                />
              </th>
              <th>Date</th>
              <th>Description</th>
              <th onClick={() => requestSort('amount')}>Amount</th>
              <th onClick={() => requestSort('category')}>Category</th>
              <th onClick={() => requestSort('group_id')}>Group</th>
              <th>Debt</th> {/* New Debt Column */}
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            {paginatedAndSortedTransactions.map((transaction) => {
              const groupName = transaction.group_id
                ? groups.find((g) => g.id === transaction.group_id)?.name || 'Unknown Group'
                : 'No Group';
              const debtName = transaction.debt_id // Get debt name
                ? debts.find((d) => d.id === transaction.debt_id)?.name || 'Unknown Debt'
                : 'No Debt';
              return (
                <tr
                  key={transaction.id}
                  className={transaction.is_ignored ? 'text-muted' : ''}
                  style={{
                    textDecoration: transaction.is_ignored ? 'line-through' : 'none',
                  }}
                >
                  <td>
                    <input
                      type="checkbox"
                      checked={selectedTransactions.includes(transaction.id)}
                      onChange={() => handleSelectTransaction(transaction.id)}
                    />
                  </td>
                  <td>{transaction.date}</td>
                  <td>{transaction.description}</td>
                  <td>{transaction.amount}</td>
                  <td onClick={() => handleEditClick(transaction.id, 'category')}>
                    {editTransactionId === transaction.id && editType === 'category' ? (
                      <SearchableDropdown
                        options={categoryOptions}
                        value={categoryOptions.find(
                          (option) => option.value === transaction.category
                        )}
                        onChange={(selectedOption) =>
                          handleCategoryChange(
                            transaction.id,
                            selectedOption ? selectedOption.value : ''
                          )
                        }
                      />
                    ) : (
                      transaction.category
                    )}
                  </td>
                  <td onClick={() => handleEditClick(transaction.id, 'group')}>
                    {editTransactionId === transaction.id && editType === 'group' ? (
                      <SearchableDropdown
                        options={groupOptions}
                        value={groupOptions.find(
                          (option) => option.value === transaction.group_id
                        )}
                        onChange={(selectedOption) =>
                          handleGroupChange(
                            transaction.id,
                            selectedOption ? selectedOption.value : null
                          )
                        }
                      />
                    ) : (
                      groupName
                    )}
                  </td>
                  {/* New Debt Column for Desktop */}
                  <td onClick={() => handleEditClick(transaction.id, 'debt')}>
                    {editTransactionId === transaction.id && editType === 'debt' ? (
                      <SearchableDropdown
                        options={debtOptions}
                        value={debtOptions.find(
                          (option) => option.value === transaction.debt_id
                        )}
                        onChange={(selectedOption) =>
                          handleDebtChange(
                            transaction.id,
                            selectedOption ? selectedOption.value : null
                          )
                        }
                      />
                    ) : (
                      debtName
                    )}
                  </td>
                  <td>
                    <button
                      className="btn btn-secondary btn-sm ms-2"
                      onClick={() => ignoreTransaction(transaction.id)}
                    >
                      {transaction.is_ignored ? 'Unignore' : 'Ignore'}
                    </button>
                    
                    <button 
                        className="btn btn-primary btn-sm ms-2"
                        onClick={() => handleSplitClick(transaction)}
                    >
                        Split
                    </button>

                    <button 
                        className="btn btn-info btn-sm ms-2"
                        onClick={() => handleUploadClick(transaction.id)}
                        title={transaction.receipt_url ? "Update Receipt" : "Add Receipt"}
                    >
                        {transaction.receipt_url ? 'Receipt+' : 'Receipt'}
                    </button>
                    
                    {transaction.receipt_url && (
                        <a href={getReceiptUrl(transaction.receipt_url)} target="_blank" rel="noreferrer" className="btn btn-light btn-sm ms-1">
                            View
                        </a>
                    )}

                  </td>
                </tr>
              );
            })}
          </tbody>
        </table>
      )}
    </>
  );
});

export default TransactionsTable;
