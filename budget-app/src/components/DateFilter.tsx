import React, { useContext } from 'react';
import { AppContext } from '../context/AppContext';

const DateFilter: React.FC = () => {
  const context = useContext(AppContext);

  if (!context) {
    return null;
  }

  const { startDate, endDate, setStartDate, setEndDate } = context;

  return (
    <div className="row mb-4">
      <div className="col">
        <label htmlFor="startDate" className="form-label">
          Start Date
        </label>
        <input
          type="date"
          className="form-control"
          id="startDate"
          value={startDate}
          onChange={(e) => setStartDate(e.target.value)}
        />
      </div>
      <div className="col">
        <label htmlFor="endDate" className="form-label">
          End Date
        </label>
        <input
          type="date"
          className="form-control"
          id="endDate"
          value={endDate}
          onChange={(e) => setEndDate(e.target.value)}
        />
      </div>
    </div>
  );
};

export default DateFilter;
