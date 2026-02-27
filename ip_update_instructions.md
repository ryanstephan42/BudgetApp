I have updated the `API_BASE_URL` in `budget-app/src/services/api.ts` to `http://192.168.1.239:5500/api`.

Now, please follow these steps:

1.  **Restart the Backend Server:**
    *   Go to your `server` directory: `cd server`
    *   Stop the server if it's running (Ctrl+C).
    *   Start it again: `npm start`

2.  **Restart the Frontend Application:**
    *   Go to your `budget-app` directory: `cd budget-app`
    *   Stop the server if it's running (Ctrl+C).
    *   Start it again: `npm run dev`

3.  **Access from your Phone:**
    *   On your phone, open a web browser and navigate to `http://192.168.1.239:5173/` (note the port for the frontend application, which is typically 5173 for Vite development server).

**Important Considerations:**

*   **Firewall:** If you still experience "connection refused" or similar errors, your computer's firewall might be blocking incoming connections on port `5500` (for the backend) or `5173` (for the frontend). You may need to configure your firewall to allow these connections.
*   **Network:** Ensure both your computer and your phone are connected to the *same local network* (e.g., the same Wi-Fi network).

Please let me know if the data now populates correctly on your phone!