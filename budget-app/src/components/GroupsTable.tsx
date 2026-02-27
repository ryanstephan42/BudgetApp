import React, { useContext, useState } from 'react';
import { AppContext } from '../context/AppContext';
import type { Group } from '../context/AppContext';

const GroupsTable: React.FC = () => {
  const context = useContext(AppContext);
  const [editGroupId, setEditGroupId] = useState<string | null>(null);
  const [editName, setEditName] = useState('');

  if (!context) {
    return null;
  }

  const { groups, transactions, updateGroup, deleteGroup } = context;

  const handleEditClick = (group: Group) => {
    setEditGroupId(group.id);
    setEditName(group.name);
  };

  const handleSaveClick = (groupId: string) => {
    updateGroup(groupId, editName);
    setEditGroupId(null);
    setEditName('');
  };

  const handleCancelClick = () => {
    setEditGroupId(null);
    setEditName('');
  };

  const getSpentAmount = (groupId: string) => {
    return transactions
      .filter((t) => t.group_id === groupId && !t.is_ignored)
      .reduce((acc, t) => acc + parseFloat(t.amount.toString()), 0);
  };

  return (
    <table className="table table-dark table-striped">
      <thead>
        <tr>
          <th>Group</th>
          <th>Spent</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        {groups.map((group) => {
          const spent = getSpentAmount(group.id);
          return (
            <tr key={group.id}>
              <td>
                {editGroupId === group.id ? (
                  <input
                    type="text"
                    className="form-control"
                    value={editName}
                    onChange={(e) => setEditName(e.target.value)}
                  />
                ) : (
                  group.name
                )}
              </td>
              <td>{spent.toFixed(2)}</td>
              <td>
                {editGroupId === group.id ? (
                  <>
                    <button
                      className="btn btn-success btn-sm me-2"
                      onClick={() => handleSaveClick(group.id)}
                    >
                      Save
                    </button>
                    <button
                      className="btn btn-secondary btn-sm"
                      onClick={handleCancelClick}
                    >
                      Cancel
                    </button>
                  </>
                ) : (
                  <>
                    <button
                      className="btn btn-primary btn-sm"
                      onClick={() => handleEditClick(group)}
                    >
                      Edit
                    </button>
                    <button
                      className="btn btn-danger btn-sm ms-2"
                      onClick={() => deleteGroup(group.id)}
                    >
                      Delete
                    </button>
                  </>
                )}
              </td>
            </tr>
          );
        })}
      </tbody>
    </table>
  );
};

export default GroupsTable;
