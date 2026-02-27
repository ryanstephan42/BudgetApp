import React, { useState, useContext } from 'react';
import { AppContext } from '../context/AppContext';

const AddCategoryForm: React.FC = () => {
  const context = useContext(AppContext);
  const [category, setCategory] = useState('');
  const [allocated, setAllocated] = useState(0);

  if (!context) {
    return null;
  }

  const { addBudget } = context;

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (category && allocated >= 0) {
      addBudget({ category, allocated });
      setCategory('');
      setAllocated(0);
    }
  };

  return (
    <form onSubmit={handleSubmit} className="mb-4">
      <h3>Add New Category</h3>
      <div className="row g-3">
        <div className="col-12 col-md-4">
          <label htmlFor="categoryName" className="form-label">Category Name</label>
          <input
            type="text"
            className="form-control"
            id="categoryName"
            placeholder="Category Name"
            value={category}
            onChange={(e) => setCategory(e.target.value)}
          />
        </div>
        <div className="col-12 col-md-4">
          <label htmlFor="allocatedAmount" className="form-label">Allocated Amount</label>
          <input
            type="number"
            className="form-control"
            id="allocatedAmount"
            placeholder="Allocated Amount"
            value={allocated}
            onChange={(e) => setAllocated(parseFloat(e.target.value))}
          />
        </div>
        <div className="col-12 col-md-4 d-grid">
          <label className="form-label visually-hidden">Submit</label>
          <button type="submit" className="btn btn-primary">
            Add Category
          </button>
        </div>
      </div>
    </form>
  );
};

export default AddCategoryForm;
