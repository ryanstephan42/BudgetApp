It sounds like the issue is that your phone cannot reach the backend server, which is currently running on `localhost`.

`localhost` refers to the machine itself. When your phone tries to access `http://localhost:5500/api`, it's looking for a server running on the phone *itself*, not on your computer.

To make your backend accessible from other devices on your local network (like your phone), you need to:

1.  **Find your computer's local IP address:** This is the address other devices on your network use to communicate with your computer.
2.  **Update the frontend's `API_BASE_URL`:** Change `http://localhost:5500/api` to `http://<YOUR_COMPUTERS_IP_ADDRESS>:5500/api` in `budget-app/src/services/api.ts`.
3.  **Ensure your computer's firewall isn't blocking the connection:** If you have a firewall, you might need to allow incoming connections on port `5500`.

Let's start by finding your computer's local IP address. Please run the following command in your terminal (on the machine running the backend server):

`ip a`

This command will list your network interfaces and their IP addresses. Look for an interface that is active (not `LOOPBACK`) and has an `inet` address. It usually starts with `192.168.x.x` or `10.0.x.x`.

Please provide the output of `ip a`.