# Implementation Plan: Debt Tracking & Loan Management

## Objective
1. Create a "Debts" page to track loans (Credit Cards, Car Note, Mortgage).
2. Visualize payoff progress (Balance vs. Starting Amount).
3. **Link Transactions to Debts:** When a payment transaction is made, automatically reduce the debt balance.

## Architecture Decisions
- **Database:**
  - New table `debts`: `id`, `name`, `starting_balance`, `current_balance`, `interest_rate`, `min_payment`, `due_date`.
  - Update `transactions` table: Add `debt_id` (UUID, nullable) Foreign Key.
- **Backend Logic:**
  - When a Transaction is created/updated with a `debt_id`, update the `current_balance` of that debt.
- **Frontend:**
  - New `DebtsPage`.
  - Visuals: Progress bars that fill as debt decreases.
  - "Time to Payoff" calculator based on monthly payments.

## Step 1: Database Migration
**Command:**
`psql -U r -d budget -c "SQL_COMMAND"` (Or use the intern to generate a migration script).

**SQL:**
```sql
CREATE TABLE IF NOT EXISTS debts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(255) NOT NULL,
  starting_balance DECIMAL(10, 2) NOT NULL,
  current_balance DECIMAL(10, 2) NOT NULL,
  interest_rate DECIMAL(5, 2) DEFAULT 0, -- e.g., 5.5%
  min_payment DECIMAL(10, 2) DEFAULT 0,
  due_date INT -- Day of month (e.g., 15)
);
ALTER TABLE transactions ADD COLUMN IF NOT EXISTS debt_id UUID REFERENCES debts(id) ON DELETE SET NULL;
````
```
```
## Step 2: Backend Routes (server/routes/index.js)
CRUD for Debts:

  GET /debts: Return all debts.

  POST /debts: Create new debt.

  PUT /debts/:id: Update details.

  DELETE /debts/:id: Delete debt.

Modify Transaction Logic:

  In POST /transactions: If req.body.debt_id is present:

Find the debt.

  UPDATE debts SET current_balance = current_balance - $1 WHERE id = $2 (Subtract transaction amount from debt).

Advanced (Optional for V1): Handle DELETE transaction (Add money back to debt).

## Step 3: Frontend API & Types (src/services/api.ts)
Add Debt interface.

Add getDebts, addDebt, updateDebt, deleteDebt functions.

Update Transaction interface to include debt_id.

## Step 4: Frontend UI - Debt Card (src/components/DebtCard.tsx)
Create a card component that displays:

Name and Interest Rate.

Progress Bar: Inverted. (If Current = 5000 and Start = 10000, bar is 50% "Paid").

"Estimated Payoff Date": Current Balance / Min Payment (Simple projection).

## Step 5: Frontend UI - Transaction Form Update
In TransactionForm (or Page):

Add a dropdown: "Link to Debt (Optional)".

Populate it with the list of Debts.

Logic: If a debt is selected, the Category should probably auto-set to "Debt Repayment" (if you want to be fancy), or just let the user choose.

## Step 6: Debts Page (src/pages/DebtsPage.tsx)
Display list of DebtCards.

"Add Debt" form.

Summary Header: "Total Debt Remaining".
