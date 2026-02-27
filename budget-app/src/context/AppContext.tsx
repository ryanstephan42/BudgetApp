import React, { createContext, useState, useEffect, useMemo, useCallback } from 'react';
import type { ReactNode } from 'react';
import {
  getTransactions as apiGetTransactions,
  bulkAddTransactions as apiBulkAddTransactions,
  updateTransaction as apiUpdateTransaction,
  getCategories as apiGetCategories,
  addCategory as apiAddCategory,
  updateCategory as apiUpdateCategory,
  deleteCategory as apiDeleteCategory,
  getGroups as apiGetGroups,
  addGroup as apiAddGroup,
  updateGroup as apiUpdateGroup,
  deleteGroup as apiDeleteGroup,
  getGoals as apiGetGoals,
  addGoal as apiAddGoal,
  updateGoal as apiUpdateGoal,
  deleteGoal as apiDeleteGoal,
  getDebts as apiGetDebts, // Added for debts
  addDebt as apiAddDebt,   // Added for debts
  updateDebt as apiUpdateDebt, // Added for debts
  deleteDebt as apiDeleteDebt, // Added for debts
} from '../services/api';
import type {
  Transaction as ApiTransaction,
  Group as ApiGroup,
  Goal as ApiGoal,
  Debt as ApiDebt, // Added for debts
} from '../services/api';

export interface Transaction extends ApiTransaction {
  // Frontend specific properties if any, otherwise just extend ApiTransaction
}

export interface Budget {
  category: string;
  allocated: number;
}

export interface Group extends ApiGroup {
  // Frontend specific properties if any, otherwise just extend ApiGroup
}

export interface Goal extends ApiGoal {
  // Frontend specific properties if any, otherwise just extend ApiGoal
}

export interface Debt extends ApiDebt {
  // Frontend specific properties if any, otherwise just extend ApiDebt
}

interface AppContextType {
  transactions: Transaction[];
  budgetFilteredTransactions: Transaction[];
  tableFilteredTransactions: Transaction[];
  paginatedTransactions: Transaction[];
  budgets: Budget[];
  groups: Group[];
  goals: Goal[];
  startDate: string;
  endDate: string;
  textFilter: string;
  categoryFilter: string;
  groupFilter: string[];
  currentPage: number;
  rowsPerPage: number;
  ignoredCategories: string[];
  setIgnoredCategories: React.Dispatch<React.SetStateAction<string[]>>;
  setStartDate: (date: string) => void;
  setEndDate: (date: string) => void;
  setTextFilter: (text: string) => void;
  setCategoryFilter: (category: string) => void;
  setGroupFilter: (groups: string[]) => void;
  setCurrentPage: (page: number) => void;
  setRowsPerPage: (rows: number) => void;
  addTransactions: (transactions: Omit<Transaction, 'id'>[]) => Promise<void>;
  updateTransactionCategory: (transactionId: string, category: string) => Promise<void>;
  bulkUpdateTransactionCategory: (transactionIds: string[], category: string) => Promise<void>;
  updateTransactionGroup: (transactionId: string, group_id: string | null) => Promise<void>;
  bulkUpdateTransactionGroup: (transactionIds: string[], group_id: string | null) => Promise<void>;
  updateTransactionDebt: (transactionId: string, debt_id: string | null) => Promise<void>; // Added for debt
  bulkUpdateTransactionDebt: (transactionIds: string[], debt_id: string | null) => Promise<void>; // Added for debt
  updateBudgetAllocation: (category: string, allocated: number) => void;
  addBudget: (budget: Budget) => void;
  deleteBudget: (category: string) => void;
  addGroup: (group: Omit<Group, 'id'>) => Promise<void>;
  updateGroup: (groupId: string, name: string) => Promise<void>;
  deleteGroup: (groupId: string) => Promise<void>;
  ignoreTransaction: (transactionId: string) => Promise<void>;
  addGoal: (goal: Omit<Goal, 'id'>) => Promise<void>;
  updateGoal: (goalId: string, updates: Partial<Goal>) => Promise<void>;
  deleteGoal: (goalId: string) => Promise<void>;
  updateTransaction: (transactionId: string, updates: Partial<Transaction>) => Promise<void>;
  debts: Debt[]; // Added for debts
  addDebt: (debt: Omit<Debt, 'id'>) => Promise<Debt>; // Added for debts
  updateDebt: (debtId: string, updates: Partial<Debt>) => Promise<Debt>; // Added for debts
  deleteDebt: (debtId: string) => Promise<void>; // Added for debts
}

export const AppContext = createContext<AppContextType | undefined>(undefined);

export const AppProvider: React.FC<{ children: ReactNode }> = ({ children }) => {
  const [transactions, setTransactions] = useState<Transaction[]>([]);
  const [budgets, setBudgets] = useState<Budget[]>([]);
  const [groups, setGroups] = useState<Group[]>([]);
  const [goals, setGoals] = useState<Goal[]>([]);
  const [debts, setDebts] = useState<Debt[]>([]); // Added for debts
  const today = new Date();
  const firstDayOfMonth = new Date(today.getFullYear(), today.getMonth(), 1);
  const formattedFirstDay = firstDayOfMonth.toISOString().split('T')[0];
  const [startDate, setStartDate] = useState(formattedFirstDay);
  const [endDate, setEndDate] = useState('');
  const [textFilter, setTextFilter] = useState('');
  const [categoryFilter, setCategoryFilter] = useState('');
  const [groupFilter, setGroupFilter] = useState<string[]>([]);
  const [currentPage, setCurrentPage] = useState(1);
  const [rowsPerPage, setRowsPerPage] = useState(25);
  const [ignoredCategories, setIgnoredCategories] = useState<string[]>(() => {
    const saved = localStorage.getItem('ignored_warning_categories');
    return saved ? JSON.parse(saved) : [];
  });

  useEffect(() => {
    localStorage.setItem('ignored_warning_categories', JSON.stringify(ignoredCategories));
  }, [ignoredCategories]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const fetchedTransactions = await apiGetTransactions({});
        setTransactions(fetchedTransactions);
        const fetchedCategories = await apiGetCategories();
        
        setBudgets(() => {
          const newBudgets = fetchedCategories.map(cat => {
            return { category: cat.name, allocated: parseFloat(cat.allocated.toString()) };
          });
          return newBudgets;
        });

        const fetchedGroups = await apiGetGroups();
        setGroups(fetchedGroups);
        const fetchedGoals = await apiGetGoals();
        setGoals(fetchedGoals);
        const fetchedDebts = await apiGetDebts(); // Added for debts
        setDebts(fetchedDebts); // Added for debts
      } catch (error) {
        console.error('Error fetching initial data:', error);
      }
    };

    fetchData();
  }, []); // Empty dependency array to run once on mount

  const addTransactions = useCallback(async (newTransactions: Omit<Transaction, 'id'>[]) => {
    try {
      // Ensure categories exist in backend
      const uniqueCategories = [...new Set(newTransactions.map(t => t.category))];
      await Promise.all(uniqueCategories.map(category => 
        apiAddCategory({ name: category, allocated: 0 }).catch(() => {}) // Ignore if category already exists
      ));

      await apiBulkAddTransactions(newTransactions);
      
      // Refresh transactions to get the newly added ones (and their IDs)
      const fetchedTransactions = await apiGetTransactions({});
      setTransactions(fetchedTransactions);
    } catch (error) {
      console.error('Error adding transactions:', error);
    }
  }, []);

  const updateTransaction = useCallback(async (transactionId: string, updates: Partial<Transaction>) => {
    try {
      const updatedTransaction = await apiUpdateTransaction(transactionId, updates);
      setTransactions((prevTransactions) =>
        prevTransactions.map((t) => (t.id === transactionId ? updatedTransaction : t))
      );
    } catch (error) {
      console.error('Error updating transaction:', error);
    }
  }, []);

  const updateTransactionCategory = useCallback(async (transactionId: string, category: string) => {
    try {
      // Ensure category exists in backend
      await apiAddCategory({ name: category, allocated: 0 }).catch(() => {}); // Ignore if category already exists
      const updatedTransaction = await apiUpdateTransaction(transactionId, { category });
      setTransactions((prevTransactions) =>
        prevTransactions.map((t) => (t.id === transactionId ? updatedTransaction : t))
      );
    } catch (error) {
      console.error('Error updating transaction category:', error);
    }
  }, []);

  const bulkUpdateTransactionCategory = useCallback(async (transactionIds: string[], category: string) => {
    try {
      // Ensure category exists in backend
      await apiAddCategory({ name: category, allocated: 0 }).catch(() => {}); // Ignore if category already exists
      const updatedTransactionsPromises = transactionIds.map((id) =>
        apiUpdateTransaction(id, { category })
      );
      const updatedTransactions = await Promise.all(updatedTransactionsPromises);
      setTransactions((prevTransactions) =>
        prevTransactions.map((t) => {
          const updated = updatedTransactions.find((ut) => ut.id === t.id);
          return updated ? updated : t;
        })
      );
    } catch (error) {
      console.error('Error bulk updating transaction category:', error);
    }
  }, []);

  const updateTransactionGroup = useCallback(async (transactionId: string, group_id: string | null) => {
    try {
      const updatedTransaction = await apiUpdateTransaction(transactionId, { group_id });
      setTransactions((prevTransactions) =>
        prevTransactions.map((t) => (t.id === transactionId ? updatedTransaction : t))
      );
    } catch (error) {
      console.error('Error updating transaction group:', error);
    }
  }, []);

  const bulkUpdateTransactionGroup = useCallback(async (transactionIds: string[], group_id: string | null) => {
    try {
      const updatedTransactionsPromises = transactionIds.map((id) =>
        apiUpdateTransaction(id, { group_id })
      );
      const updatedTransactions = await Promise.all(updatedTransactionsPromises);
      setTransactions((prevTransactions) =>
        prevTransactions.map((t) => {
          const updated = updatedTransactions.find((ut) => ut.id === t.id);
          return updated ? updated : t;
        })
      );
    } catch (error) {
      console.error('Error bulk updating transaction group:', error);
    }
  }, []);

  const updateTransactionDebt = useCallback(async (transactionId: string, debt_id: string | null) => {
    try {
      const updatedTransaction = await apiUpdateTransaction(transactionId, { debt_id });
      setTransactions((prevTransactions) =>
        prevTransactions.map((t) => (t.id === transactionId ? updatedTransaction : t))
      );
    } catch (error) {
      console.error('Error updating transaction debt:', error);
    }
  }, []);

  const bulkUpdateTransactionDebt = useCallback(async (transactionIds: string[], debt_id: string | null) => {
    try {
      const updatedTransactionsPromises = transactionIds.map((id) =>
        apiUpdateTransaction(id, { debt_id })
      );
      const updatedTransactions = await Promise.all(updatedTransactionsPromises);
      setTransactions((prevTransactions) =>
        prevTransactions.map((t) => {
          const updated = updatedTransactions.find((ut) => ut.id === t.id);
          return updated ? updated : t;
        })
      );
    } catch (error) {
      console.error('Error bulk updating transaction debt:', error);
    }
  }, []);

  const updateBudgetAllocation = useCallback(async (category: string, allocated: number) => {
    try {
      const updatedCategory = await apiUpdateCategory(category, { allocated });
      setBudgets((prevBudgets) =>
        prevBudgets.map((b) =>
          b.category === category ? { ...b, allocated: parseFloat(updatedCategory.allocated.toString()) } : b
        )
      );
    } catch (error) {
      console.error('Error updating budget allocation:', error);
    }
  }, []);

  const addBudget = useCallback(async (budget: Budget) => {
    try {
      const newCategory = await apiAddCategory({ name: budget.category, allocated: budget.allocated });
      setBudgets((prevBudgets) => [...prevBudgets, { category: newCategory.name, allocated: parseFloat(newCategory.allocated.toString()) }]);
    } catch (error) {
      console.error('Error adding budget/category:', error);
    }
  }, []);

  const deleteBudget = useCallback(async (category: string) => {
    try {
      await apiDeleteCategory(category);
      setBudgets((prevBudgets) => prevBudgets.filter((b) => b.category !== category));
    } catch (error) {
      console.error('Error deleting budget/category:', error);
    }
  }, []);

  const addGroup = useCallback(async (group: Omit<Group, 'id'>) => {
    try {
      console.log('AppContext: Calling apiAddGroup with:', group);
      const newGroup = await apiAddGroup(group);
      console.log('AppContext: apiAddGroup successful, new group:', newGroup);
      setGroups((prevGroups) => [...prevGroups, newGroup]);
      console.log('AppContext: Groups state updated after addGroup.');
    } catch (error) {
      console.error('Error adding group:', error);
    }
  }, []);

  const updateGroup = useCallback(async (groupId: string, name: string) => {
    try {
      console.log('AppContext: Calling apiUpdateGroup for ID:', groupId, 'with name:', name);
      const updatedGroup = await apiUpdateGroup(groupId, { name });
      console.log('AppContext: apiUpdateGroup successful, updated group:', updatedGroup);
      setGroups((prevGroups) =>
        prevGroups.map((g) => (g.id === groupId ? updatedGroup : g))
      );
      console.log('AppContext: Groups state updated after updateGroup.');
    } catch (error) {
      console.error('Error updating group:', error);
    }
  }, []);

  const deleteGroup = useCallback(async (groupId: string) => {
    try {
      console.log('AppContext: Calling apiDeleteGroup for ID:', groupId);
      await apiDeleteGroup(groupId);
      console.log('AppContext: apiDeleteGroup successful for ID:', groupId);
      setGroups((prevGroups) => prevGroups.filter((g) => g.id !== groupId));
      // Also update transactions that belonged to this group
      setTransactions((prevTransactions) =>
        prevTransactions.map((t) => (t.group_id === groupId ? { ...t, group_id: null } : t))
      );
      console.log('AppContext: Groups and Transactions state updated after deleteGroup.');
    } catch (error) {
      console.error('Error deleting group:', error);
    }
  }, [transactions]);

  const ignoreTransaction = useCallback(async (transactionId: string) => {
    try {
      const transactionToUpdate = transactions.find(t => t.id === transactionId);
      if (transactionToUpdate) {
        const updatedTransaction = await apiUpdateTransaction(transactionId, { is_ignored: !transactionToUpdate.is_ignored });
        setTransactions((prevTransactions) =>
          prevTransactions.map((t) => (t.id === transactionId ? updatedTransaction : t))
        );
      }
    } catch (error) {
      console.error('Error ignoring transaction:', error);
    }
  }, [transactions]);

  const addGoal = useCallback(async (goal: Omit<Goal, 'id'>) => {
    try {
      const newGoal = await apiAddGoal(goal);
      setGoals((prevGoals) => [...prevGoals, newGoal]);
    } catch (error) {
      console.error('Error adding goal:', error);
    }
  }, []);

  const updateGoal = useCallback(async (goalId: string, updates: Partial<Goal>) => {
    try {
      const updatedGoal = await apiUpdateGoal(goalId, updates);
      setGoals((prevGoals) =>
        prevGoals.map((g) => (g.id === goalId ? updatedGoal : g))
      );
    } catch (error) {
      console.error('Error updating goal:', error);
    }
  }, []);

  const deleteGoal = useCallback(async (goalId: string) => {
    try {
      await apiDeleteGoal(goalId);
      setGoals((prevGoals) => prevGoals.filter((g) => g.id !== goalId));
    } catch (error) {
      console.error('Error deleting goal:', error);
    }
  }, []);

  // Debt Functions (added)
  const addDebt = useCallback(async (debt: Omit<Debt, 'id'>) => {
    try {
      const newDebt = await apiAddDebt(debt);
      setDebts((prevDebts) => [...prevDebts, newDebt]);
      return newDebt;
    } catch (error) {
      console.error('Error adding debt:', error);
      throw error;
    }
  }, []);

  const updateDebt = useCallback(async (debtId: string, updates: Partial<Debt>) => {
    try {
      const updatedDebt = await apiUpdateDebt(debtId, updates);
      setDebts((prevDebts) =>
        prevDebts.map((d) => (d.id === debtId ? updatedDebt : d))
      );
      return updatedDebt;
    } catch (error) {
      console.error('Error updating debt:', error);
      throw error;
    }
  }, []);

  const deleteDebt = useCallback(async (debtId: string) => {
    try {
      await apiDeleteDebt(debtId);
      setDebts((prevDebts) => prevDebts.filter((d) => d.id !== debtId));
    } catch (error) {
      console.error('Error deleting debt:', error);
      throw error;
    }
  }, []);

  const budgetFilteredTransactions = useMemo(() => {
    return transactions.filter((t) => {
      if (startDate && new Date(t.date) < new Date(startDate)) {
        return false;
      }
      if (endDate && new Date(t.date) > new Date(endDate)) {
        return false;
      }
      return true;
    });
  }, [transactions, startDate, endDate]);

  const tableFilteredTransactions = useMemo(() => {
    return budgetFilteredTransactions.filter((t) => {
      if (textFilter && !t.description.toLowerCase().includes(textFilter.toLowerCase())) {
        return false;
      }
      if (categoryFilter && t.category !== categoryFilter) {
        return false;
      }
      if (groupFilter.length > 0 && (t.group_id === null || !groupFilter.includes(t.group_id))) {
        return false;
      }
      return true;
    });
  }, [budgetFilteredTransactions, textFilter, categoryFilter, groupFilter]);

  const paginatedTransactions = useMemo(() => {
    const startIndex = (currentPage - 1) * rowsPerPage;
    return tableFilteredTransactions.slice(startIndex, startIndex + rowsPerPage);
  }, [tableFilteredTransactions, currentPage, rowsPerPage]);

  return (
    <AppContext.Provider
      value={{
        transactions,
        budgetFilteredTransactions,
        tableFilteredTransactions,
        paginatedTransactions,
        budgets,
        groups,
        goals,
        startDate,
        endDate,
        textFilter,
        categoryFilter,
        groupFilter,
        currentPage,
        rowsPerPage,
        ignoredCategories,
        setIgnoredCategories,
        setStartDate,
        setEndDate,
        setTextFilter,
        setCategoryFilter,
        setGroupFilter,
        setCurrentPage,
        setRowsPerPage,
        addTransactions,
        updateTransaction,
        updateTransactionCategory,
        bulkUpdateTransactionCategory,
        updateTransactionGroup,
        bulkUpdateTransactionGroup,
        updateTransactionDebt, // Added for debt
        bulkUpdateTransactionDebt, // Added for debt
        updateBudgetAllocation,
        addBudget,
        deleteBudget,
        addGroup,
        updateGroup,
        deleteGroup,
        ignoreTransaction,
        addGoal,
        updateGoal,
        deleteGoal,
        debts, // Added for debts
        addDebt, // Added for debts
        updateDebt, // Added for debts
        deleteDebt, // Added for debts
      }}
    >
      {children}
    </AppContext.Provider>
  );
};
