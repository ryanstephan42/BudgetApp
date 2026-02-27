import React, { useContext, useState } from 'react';
import Papa from 'papaparse';
import { AppContext } from '../context/AppContext';
import type { Transaction } from '../context/AppContext';

const FileUploader: React.FC = () => {
  const context = useContext(AppContext);
  const [file, setFile] = useState<File | null>(null);

  if (!context) {
    return null;
  }

  const { addTransactions, transactions } = context;

  const handleFileChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    const files = event.target.files;
    if (files && files.length > 0) {
      setFile(files[0]);
    }
  };
  type NewTransaction = Omit<Transaction, 'id'>;
  const handleUpload = () => {
    if (file) {
      Papa.parse(file, {
        header: true,
        skipEmptyLines: true,
        complete: (results) => {
          // Pre-calculate the most recent category for each description to optimize lookup
          const latestCategoriesMap = new Map<string, string>();
          // Sort transactions by date ascending so that the most recent ones are processed last and overwrite earlier ones in the map
          [...transactions]
            .filter(t => t.category !== 'Uncategorized')
            .sort((a, b) => new Date(a.date).getTime() - new Date(b.date).getTime())
            .forEach(t => {
              latestCategoriesMap.set(t.description, t.category);
            });

          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          const newTransactions = results.data
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
            .map((row: any): NewTransaction | null=> {
              // Basic validation
              if (!row['Transaction Date'] || !row.Description || !row.Amount) {
                return null;
              }
              
              let amount = parseFloat(row.Amount);
              if (row['Credit Debit Indicator'] === 'Credit') {
                amount = -amount;
              }

              // Normalize date to YYYY-MM-DD
              const rawDate = row['Transaction Date'];
              const dateObj = new Date(rawDate);
              const normalizedDate = !isNaN(dateObj.getTime()) 
                ? dateObj.toISOString().split('T')[0] 
                : rawDate;

              // Auto-categorization: Use pre-calculated map
              const category = latestCategoriesMap.get(row.Description) || 'Uncategorized';

              return {
                date: normalizedDate,
                description: row.Description,
                amount: amount,
                category: category,
                group_id: null,
                is_ignored: false,
                raw_data: row,
                is_split: false,
                split_details: null
              };
            })
            // eslint-disable-next-line @typescript-eslint/no-explicit-any
            .filter((t): t is NewTransaction => t !== null);

          addTransactions(newTransactions as NewTransaction[]);
        },
      });
    }
  };

  return (
    <div className="mb-3 card bg-secondary p-3">
      <label htmlFor="formFile" className="form-label h5">
        Upload Transactions CSV
      </label>
      <div className="input-group">
        <input
          className="form-control"
          type="file"
          id="formFile"
          accept=".csv"
          onChange={handleFileChange}
        />
        <button
          className="btn btn-outline-info"
          type="button"
          onClick={() => window.open('https://www.navyfederal.com', '_blank')}
        >
          Fetch
        </button>
        <button
          className="btn btn-primary"
          type="button"
          onClick={handleUpload}
          disabled={!file}
        >
          Upload
        </button>
      </div>
    </div>
  );
};

export default FileUploader;
