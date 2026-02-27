#!/bin/bash

# Install frontend dependencies
echo "Installing frontend dependencies..."
(cd budget-app && npm install)

# Install backend dependencies
echo "Installing backend dependencies..."
(cd server && npm install)

# Start backend server in the background
echo "Starting backend server..."
(cd server && npm start) &

# Start frontend development server
echo "Starting frontend development server..."
(cd budget-app && npm run dev)
