The migration script has been saved to `migration_script.js` in your project's root directory.

To load all your existing data into the new PostgreSQL database so it's consistent across devices, please follow these steps carefully:

1.  **Ensure Backend Server is Running:**
    *   Go to your `server` directory: `cd server`
    *   Start the backend server: `npm start`
    *   Keep this terminal window open.

2.  **Ensure Frontend Application is Running:**
    *   Go to your `budget-app` directory: `cd budget-app`
    *   Start the frontend development server: `npm run dev`
    *   Keep this terminal window open.

3.  **Open Frontend in Browser (on the device that has your data):**
    *   Navigate to your budget application in the browser (e.g., `http://localhost:5173/`).
    *   **IMPORTANT:** Do this on the device where your budget data is currently stored in `localStorage`.

4.  **Open Browser Developer Console:**
    *   Once the application is loaded, open your browser's developer console (usually by pressing F12 or right-clicking and selecting "Inspect" -> "Console").

5.  **Run Migration Script:**
    *   Copy the entire content of the `migration_script.js` file.
    *   Paste it into the console and press Enter.
    *   Observe the console output for migration progress and any errors. It will log messages like "Migrated category:", "Migrated group:", "Migrated transaction:".

6.  **Verify Data:**
    *   After the script completes (you'll see "Data migration complete."), refresh the frontend application in your browser.
    *   Your data should now be loaded from the PostgreSQL database.

7.  **Check on Other Devices:**
    *   Now, you can open the application on your other device(s). They should also display the same data, as it's now coming from the central database.

8.  **Clear Local Storage (Optional but Recommended):**
    *   Once you've verified that all your data is correctly in the database and visible on all devices, you can clear your browser's `localStorage` for this application on the original device to prevent conflicts. You can usually do this in the "Application" tab of the developer console.

Let me know once you've completed these steps and if the data is now loading correctly on all your devices!