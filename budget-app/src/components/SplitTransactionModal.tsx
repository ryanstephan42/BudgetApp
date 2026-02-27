import React, { useState } from 'react';
import type { Transaction } from '../services/api';

interface Split {
  category: string;
  amount: number;
  note: string;
}

interface SplitTransactionModalProps {
  show: boolean;
  onClose: () => void;
  onSave: (transactionId: string, splits: Split[]) => void;
  transaction: Transaction | null;
  categories: string[];
}

const SplitTransactionModal: React.FC<SplitTransactionModalProps> = ({
  show,
  onClose,
  onSave,
  transaction,
  categories,
}) => {
  const [splits, setSplits] = useState<Split[]>(() => {
    if (!transaction) return [];
    if (transaction.splits && transaction.splits.length > 0) {
      return transaction.splits.map(s => ({ ...s, note: s.note || '' }));
    }
    return [{ category: transaction.category, amount: transaction.amount, note: '' }];
  });

  if (!show || !transaction) return null;

  const totalSplitAmount = splits.reduce((sum, split) => sum + (Number(split.amount) || 0), 0);
  const remainingAmount = transaction.amount - totalSplitAmount;
  const isValid = Math.abs(remainingAmount) < 0.01; // Allow small float errors

  const handleSplitChange = (index: number, field: keyof Split, value: string | number) => {
    const newSplits = [...splits];
    newSplits[index] = { ...newSplits[index], [field]: value };
    setSplits(newSplits);
  };

  const addSplit = () => {
    setSplits([...splits, { category: categories[0] || '', amount: 0, note: '' }]);
  };

  const removeSplit = (index: number) => {
    setSplits(splits.filter((_, i) => i !== index));
  };

  const handleSave = () => {
    if (isValid) {
      onSave(transaction.id, splits);
      onClose();
    }
  };

  return (
    <div className="modal show d-block" style={{ backgroundColor: 'rgba(0,0,0,0.5)' }} tabIndex={-1}>
      <div className="modal-dialog modal-lg">
        <div className="modal-content">
          <div className="modal-header">
            <h5 className="modal-title">Split Transaction</h5>
            <button type="button" className="btn-close" onClick={onClose}></button>
          </div>
          <div className="modal-body">
            <div className="mb-3">
              <strong>Original Transaction:</strong> {transaction.description} ({transaction.amount})
            </div>
            
            {splits.map((split, index) => (
              <div key={index} className="row mb-2 align-items-end">
                <div className="col-md-4">
                  <label className="form-label small">Category</label>
                  <select
                    className="form-select"
                    value={split.category}
                    onChange={(e) => handleSplitChange(index, 'category', e.target.value)}
                  >
                    <option value="">Select Category</option>
                    {categories.map((cat) => (
                      <option key={cat} value={cat}>
                        {cat}
                      </option>
                    ))}
                  </select>
                </div>
                <div className="col-md-3">
                  <label className="form-label small">Amount</label>
                  <input
                    type="number"
                    className="form-control"
                    value={split.amount}
                    onChange={(e) => handleSplitChange(index, 'amount', parseFloat(e.target.value))}
                    step="0.01"
                  />
                </div>
                <div className="col-md-4">
                  <label className="form-label small">Note</label>
                  <input
                    type="text"
                    className="form-control"
                    value={split.note}
                    onChange={(e) => handleSplitChange(index, 'note', e.target.value)}
                    placeholder="Note"
                  />
                </div>
                <div className="col-md-1">
                  <button
                    className="btn btn-danger btn-sm"
                    onClick={() => removeSplit(index)}
                    disabled={splits.length <= 1}
                  >
                    X
                  </button>
                </div>
              </div>
            ))}

            <button className="btn btn-secondary btn-sm mt-2" onClick={addSplit}>
              + Add Split
            </button>

            <div className="mt-3 d-flex justify-content-between align-items-center border-top pt-2">
              <span>Total: <strong>{totalSplitAmount.toFixed(2)}</strong></span>
              <span className={isValid ? 'text-success' : 'text-danger'}>
                Remaining: <strong>{remainingAmount.toFixed(2)}</strong>
              </span>
            </div>
          </div>
          <div className="modal-footer">
            <button type="button" className="btn btn-secondary" onClick={onClose}>
              Cancel
            </button>
            <button type="button" className="btn btn-primary" onClick={handleSave} disabled={!isValid}>
              Save Splits
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default SplitTransactionModal;
