I have moved the `DateFilter` component to `App.tsx` and removed it from `TransactionsPage.tsx` and `BudgetsPage.tsx`.

This means the date filter will now be rendered once at the application level, and its selected dates will persist as you navigate between the Transactions and Budgets pages. Both pages will automatically reflect the global date filter because they rely on the `budgetFilteredTransactions` from `AppContext`, which is already filtered by the `startDate` and `endDate`.

Please follow these steps to test the new functionality:

1.  **Restart the Frontend Application:**
    *   Go to your `budget-app` directory: `cd budget-app`
    *   Stop the server if it's running (Ctrl+C).
    *   Start it again: `npm run dev`

2.  **Test Date Filter Persistence:**
    *   Open your frontend application in the browser.
    *   Go to the Transactions page.
    *   Set a date range using the date filter.
    *   Navigate to the Budgets page.
    *   Verify that the same date range is still applied and the budget calculations reflect this filter.
    *   Navigate back to the Transactions page and confirm the filter is still active.

Please let me know if the date filter now persists correctly between the pages!