# Implementation Plan: Split Transactions & Receipt Attachments

## Objective
1. Allow users to upload an image (receipt) for a transaction.
2. Allow users to split a single transaction into multiple categories/amounts.

## Architecture Decisions
- **Database:**
  - Add `receipt_url` (TEXT) to `transactions` table.
  - Add `splits` (JSONB) to `transactions` table. Structure: `[{ category: string, amount: number, note: string }]`.
- **File Storage:** Local filesystem (`server/uploads/`).
- **Frontend:** Update forms to support `FormData` (multipart/form-data) instead of just JSON.

## Step 1: Install Backend Dependencies
**Command:**
`cd server && npm install multer`

## Step 2: Database Migration & Backend Setup
Modify `server/database.js` and `server/index.js`.
1. Run SQL migration:
   ```sql
   ALTER TABLE transactions ADD COLUMN IF NOT EXISTS receipt_url TEXT;
   ALTER TABLE transactions ADD COLUMN IF NOT EXISTS splits JSONB DEFAULT '[]';
In server/index.js:

Import multer. Configure it to save files to ./uploads.

Add app.use('/uploads', express.static('uploads')); so images can be viewed.

Ensure the uploads directory exists on startup.

## Step 3: Update Backend Routes (server/routes/index.js)
Update POST /transactions and PUT /transactions/:id:

Use upload.single('receipt') middleware.

If req.file exists, save the path (e.g., /uploads/filename.jpg) to receipt_url.

Parse req.body.splits (it will arrive as a JSON string via FormData).

Validation: If splits exists, ensure the sum of split amounts equals req.body.amount.

## Step 4: Frontend API Update (src/services/api.ts)
The addTransaction and updateTransaction functions currently send JSON.

Update them to check if transaction.file or transaction.splits exists.

If yes, create a FormData object.

Append all fields to FormData.

Change the axios headers to Content-Type: multipart/form-data.

## Step 5: Frontend UI - Splits (src/components/SplitTransactionModal.tsx)
Create a new component SplitTransactionModal.

Input: totalAmount and categories.

State: Array of splits.

Feature: "Add Split" button.

Validation: Show "Remaining Amount" in Red if not 0.

Output: Pass the array of splits back to the parent form.

##  Step 6: Frontend UI - Transaction Form (src/components/TransactionForm.tsx)
Note: You may need to refactor the Add/Edit logic into a reusable form if you haven't yet, otherwise update the Modal/Page directly.

Add a "Split Transaction" button that opens the modal from Step 5.

Add an ```html <input type="file" />``` for receipts.

Show a preview of receipt_url if it exists.

## Step 7: Update Analytics (src/utils/analyticsHelpers.ts)
This is critical.

Modify calculateCategoryBreakdown and calculateBudgetVsActual.

Logic: Iterate through transactions.

IF t.splits has length > 0: Loop through splits and add those amounts to their respective categories.

ELSE: Use t.amount and t.category as normal.
