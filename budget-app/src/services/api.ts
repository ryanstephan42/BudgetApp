import axios from 'axios';

const API_BASE_URL = '/api'; // Backend API URL

const api = axios.create({
  baseURL: API_BASE_URL,
});

export interface Transaction {
  id: string;
  date: string;
  description: string;
  amount: number;
  category: string;
  group_id: string | null; // Changed to group_id to match backend
  is_ignored: boolean;
  raw_data: any; // Use 'any' for now, or define a more specific interface if raw_data structure is known
  is_split: boolean;
  split_details: any; // JSONB can be any object structure
  receipt_url?: string; // Optional URL to receipt image
  splits?: { category: string; amount: number; note?: string }[] | null;
  file?: File; // Optional receipt file to upload
  debt_id?: string | null; // Optional debt ID
}

export interface Category {
  name: string;
  allocated: number;
}

export interface Group {
  id: string;
  name: string;
}

// Helper to parse amount fields which may be strings from the backend
const parseTransactionAmounts = (transaction: any): Transaction => ({
  ...transaction,
  amount: parseFloat(transaction.amount),
});

// Helper to create FormData for transactions with files or splits
const createTransactionFormData = (transaction: Omit<Transaction, 'id'> | Partial<Transaction>): FormData | null => {
  if (!transaction.file && (!transaction.splits || transaction.splits.length === 0)) {
    return null;
  }

  const formData = new FormData();
  for (const key in transaction) {
    if (Object.prototype.hasOwnProperty.call(transaction, key)) {
      const value = (transaction as any)[key];
      if (key === 'file' && value instanceof File) {
        formData.append('receipt', value);
      } else if (key === 'splits' && value && value.length > 0) {
        formData.append('splits', JSON.stringify(value));
      } else if (key !== 'file' && key !== 'splits' && value !== undefined && value !== null) {
        formData.append(key, String(value));
      }
    }
  }
  return formData;
};

// --- Transactions API ---
export const getTransactions = async (filters?: {
  startDate?: string;
  endDate?: string;
  textFilter?: string;
  categoryFilter?: string;
  groupFilter?: string[];
}): Promise<Transaction[]> => {
  const response = await api.get('/transactions', { params: {
    ...filters,
    groupFilter: filters?.groupFilter?.join(',') // Convert array to comma-separated string for backend
  }});
  return response.data.map(parseTransactionAmounts);
};

export const addTransaction = async (transaction: Omit<Transaction, 'id'>): Promise<Transaction> => {
  const formData = createTransactionFormData(transaction);
  let response;
  if (formData) {
    response = await api.post('/transactions', formData, {
      headers: {
        'Content-Type': 'multipart/form-data',
      },
    });
  } else {
    response = await api.post('/transactions', transaction);
  }
  return parseTransactionAmounts(response.data);
};

export const bulkAddTransactions = async (transactions: Omit<Transaction, 'id'>[]): Promise<{ message: string }> => {
  const response = await api.post('/transactions/bulk', transactions);
  return response.data;
};

export const updateTransaction = async (id: string, transaction: Partial<Transaction>): Promise<Transaction> => {
  const formData = createTransactionFormData(transaction);
  let response;
  if (formData) {
    // When sending FormData, the ID should not be part of the formData, but rather in the URL
    // We already remove 'file' and 'splits' in createTransactionFormData
    response = await api.put(`/transactions/${id}`, formData, {
      headers: {
        'Content-Type': 'multipart/form-data',
      },
    });
  } else {
    response = await api.put(`/transactions/${id}`, transaction);
  }
  return parseTransactionAmounts(response.data);
};

export const deleteTransaction = async (id: string): Promise<void> => {
  await api.delete(`/transactions/${id}`);
};

export const categorizeTransaction = async (description: string): Promise<{ category: string, confidence: number }> => {
  const response = await api.get('/categorize', { params: { description } });
  return response.data;
};


// --- Categories API ---
export const getCategories = async (): Promise<Category[]> => {
  const response = await api.get('/categories');
  return response.data;
};

export const addCategory = async (category: Category): Promise<Category> => {
  const response = await api.post('/categories', category);
  return response.data;
};

export const deleteCategory = async (name: string): Promise<void> => {
  await api.delete(`/categories/${name}`);
};

export const updateCategory = async (name: string, category: Partial<Category>): Promise<Category> => {
  const response = await api.put(`/categories/${name}`, category);
  return response.data;
};

// --- Groups API ---
export const getGroups = async (): Promise<Group[]> => {
  const response = await api.get('/groups');
  return response.data;
};

export const addGroup = async (group: Omit<Group, 'id'>): Promise<Group> => {
  const response = await api.post('/groups', group);
  return response.data;
};

export const updateGroup = async (id: string, group: Partial<Group>): Promise<Group> => {
  const response = await api.put(`/groups/${id}`, group);
  return response.data;
};

export const deleteGroup = async (id: string): Promise<void> => {
  await api.delete(`/groups/${id}`);
};

// --- Goals API ---
export interface Goal {
  id: string;
  name: string;
  target_amount: number;
  current_amount: number;
  target_date?: string;
}

// Helper to parse amount fields which may be strings from the backend
const parseGoalAmounts = (goal: any): Goal => ({
  ...goal,
  target_amount: parseFloat(goal.target_amount),
  current_amount: parseFloat(goal.current_amount),
});

export const getGoals = async (): Promise<Goal[]> => {
  const response = await api.get('/goals');
  return response.data.map(parseGoalAmounts);
};

export const addGoal = async (goal: Omit<Goal, 'id'>): Promise<Goal> => {
  const response = await api.post('/goals', goal);
  return parseGoalAmounts(response.data);
};

export const updateGoal = async (id: string, goal: Partial<Goal>): Promise<Goal> => {
  const response = await api.put(`/goals/${id}`, goal);
  return parseGoalAmounts(response.data);
};

export const deleteGoal = async (id: string): Promise<void> => {
  await api.delete(`/goals/${id}`);
};

// --- Debts API ---
export interface Debt {
  id: string;
  name: string;
  starting_balance: number;
  current_balance: number;
  interest_rate: number;
  min_payment: number;
  due_date: number; // Day of month (e.g., 15)
}

// Helper to parse amount fields which may be strings from the backend
const parseDebtAmounts = (debt: any): Debt => ({
  ...debt,
  starting_balance: parseFloat(debt.starting_balance),
  current_balance: parseFloat(debt.current_balance),
  interest_rate: parseFloat(debt.interest_rate),
  min_payment: parseFloat(debt.min_payment),
});

export const getDebts = async (): Promise<Debt[]> => {
  const response = await api.get('/debts');
  return response.data.map(parseDebtAmounts);
};

export const addDebt = async (debt: Omit<Debt, 'id'>): Promise<Debt> => {
  const response = await api.post('/debts', debt);
  return parseDebtAmounts(response.data);
};

export const updateDebt = async (id: string, debt: Partial<Debt>): Promise<Debt> => {
  const response = await api.put(`/debts/${id}`, debt);
  return parseDebtAmounts(response.data);
};

export const deleteDebt = async (id: string): Promise<void> => {
  await api.delete(`/debts/${id}`);
};

