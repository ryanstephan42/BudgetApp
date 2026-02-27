import React from 'react';
import AddGroupForm from '../components/AddGroupForm';
import GroupsTable from '../components/GroupsTable';

const GroupsPage: React.FC = () => {
  return (
    <div>
      <h1>Groups</h1>
      <AddGroupForm />
      <GroupsTable />
    </div>
  );
};

export default GroupsPage;
