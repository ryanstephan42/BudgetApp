# Implementation Plan - Visualizations & Reports Tab

## Objective
Add a "Reports" page containing advanced analytics using `recharts`.
The page will include:
1. Category Spending Breakdown (Pie Chart)
2. Budget Adherence (Allocated vs. Actual Bar Chart)
3. 12-Month Cash Flow Trend (Income vs. Expense Line Chart)
4. Monthly Category Trends (How a specific category changes over time)

## Prerequisites
- The frontend is React + Vite.
- We will use `recharts` for visualization.

## Step 1: Install Dependencies
**Command:**
`npm install recharts` in the `budget-app` directory.

## Step 2: Create Data Processing Utilities
We need to transform the raw `Transaction[]` array into aggregated data formats for the charts.
Create `budget-app/src/utils/analyticsHelpers.ts`.

**Functions needed:**
1. `calculateCategoryBreakdown(transactions: Transaction[])`: Returns `{ name: string, value: number }[]`. Filter out Income.
2. `calculateBudgetVsActual(transactions: Transaction[], budgets: Budget[])`: Returns `{ category: string, allocated: number, spent: number }[]`.
3. `calculateMonthlyCashFlow(transactions: Transaction[])`: Group all transactions by "YYYY-MM". Returns `{ month: string, income: number, expense: number }[]`. Sort chronologically.

## Step 3: Create Chart Components
Create modular components in `budget-app/src/components/charts/`.

1. **`SpendingPieChart.tsx`**:
   - Props: `data: { name: string, value: number }[]`
   - Use `PieChart`, `Pie`, `Cell`, `Tooltip`, `Legend`.
   - Use a nice color palette (e.g., specific colors for top categories).

2. **`BudgetVsActualChart.tsx`**:
   - Props: `data: { category: string, allocated: number, spent: number }[]`
   - Use `BarChart`, `XAxis`, `YAxis`, `Tooltip`, `Legend`, `Bar`.
   - Bar 1: Allocated (Green/Blue).
   - Bar 2: Spent (Red if > Allocated, else Orange).

3. **`CashFlowTrendChart.tsx`**:
   - Props: `data: { month: string, income: number, expense: number }[]`
   - Use `LineChart`, `Line`, `XAxis`, `YAxis`, `Tooltip`.
   - Line 1: Income (Green).
   - Line 2: Expenses (Red).

## Step 4: Create the Reports Page
Create `budget-app/src/pages/ReportsPage.tsx`.

**Logic:**
1. `useContext(AppContext)` to get `transactions` and `budgets`.
2. Use `useMemo` to call the helpers from Step 2.
   - *Note:* For "Cash Flow," use the raw `transactions` (full history).
   - *Note:* For "Pie Chart" and "Budget vs Actual," use `budgetFilteredTransactions` (respects the global date filter) OR provide a toggle to switch between "This Month" and "All Time". Let's stick to global date filter for breakdown, and "Last 12 Months" for trends.
3. Layout: Use Bootstrap Grid (`row`, `col-md-6`, etc.) to arrange charts 2-by-2.

## Step 5: Update Navigation
1. Modify `budget-app/src/App.tsx`: Add Route `/reports` pointing to `ReportsPage`.
2. Modify `budget-app/src/components/MainLayout.tsx`: Add a "Reports" link in the Navbar.

## Step 6: Verify
1. Navigate to `/reports`.
2. Ensure charts render without crashing.
3. Ensure changing the Global Date Filter updates the "Spending Breakdown" and "Budget vs Actual" charts.
