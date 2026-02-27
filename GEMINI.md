# Project Overview

This is a full-stack budgeting application with a React frontend and a Node.js Express backend.

## Project Structure

*   `budget-app/`: The React frontend application.
*   `server/`: The Node.js Express backend server.
*   `package.json`: The root `package.json` contains dependencies for both the client and server.

## Building and Running

### Frontend

To run the frontend development server:

```bash
cd budget-app
npm install
npm run dev
```

### Backend

To run the backend server:

```bash
cd server
npm install
npm start
```

### Concurrent Startup

A `start.sh` script is provided to start both the frontend and backend concurrently.

```bash
./start.sh
```

## Development Conventions

*   The frontend is built with React and Vite.
*   The backend is built with Node.js and Express.
*   The backend uses a PostgreSQL database.
*   The project uses `npm` for package management.
