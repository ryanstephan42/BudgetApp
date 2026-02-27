import React, { useState, useContext } from 'react';
import { AppContext } from '../context/AppContext';

const AddGroupForm: React.FC = () => {
  const context = useContext(AppContext);
  const [name, setName] = useState('');

  if (!context) {
    return null;
  }

  const { addGroup } = context;

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (name) {
      addGroup({ name });
      setName('');
    }
  };

  return (
    <form onSubmit={handleSubmit} className="mb-4">
      <h3>Add New Group</h3>
      <div className="row g-3">
        <div className="col-12 col-md-8">
          <label htmlFor="groupName" className="form-label">Group Name</label>
          <input
            type="text"
            className="form-control"
            id="groupName"
            placeholder="Group Name"
            value={name}
            onChange={(e) => setName(e.target.value)}
          />
        </div>
        <div className="col-12 col-md-4 d-grid">
          <label className="form-label visually-hidden">Submit</label>
          <button type="submit" className="btn btn-primary">
            Add Group
          </button>
        </div>
      </div>
    </form>
  );
};

export default AddGroupForm;
