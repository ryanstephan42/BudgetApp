# Docker Deployment Guide

This guide explains how to dockerize and deploy the Budget Application using Docker Compose.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Environment Setup

The application uses an `.env` file in the root directory to manage database credentials. If you don't have one, create it based on the following template:

```env
DB_USER=r
DB_PASSWORD=your_secure_password
DB_NAME=budget
```

## How to Deploy

### 1. Build and Start the Containers

Run the following command in the root directory:

```bash
docker compose up -d --build
```

- `-d`: Runs the containers in detached mode (in the background).
- `--build`: Forces a rebuild of the images (use this if you've changed the code).

### 2. Accessing the Application

- **Frontend:** [http://localhost:3000](http://localhost:3000)
- **Backend API:** [http://localhost:3000/api](http://localhost:3000/api) (Proxied via Nginx)
- **Database:** Port `5434` (on host)

### 3. Verification

Check if all containers are running:

```bash
docker compose ps
```

To view logs:

```bash
docker compose logs -f
```

## Infrastructure Details

The deployment consists of 4 main services:

1.  **`db`**: A PostgreSQL 16 database. Data is persisted in a Docker volume named `postgres_data`.
2.  **`backend`**: Node.js Express API. Handles logic, auto-categorization (AI), and database interactions.
3.  **`frontend`**: Vite/React app served by Nginx. Nginx is configured to proxy `/api` requests to the backend service.
4.  **`backup`**: Automatically runs every day at 3:00 AM, creating compressed SQL dumps in the `./db_bkups` folder.

## Common Operations

### Stopping the App

```bash
docker compose down
```

### Restarting a Specific Service (e.g., Backend)

```bash
docker compose restart backend
```

### Updating the App

If you've made changes to the code:

```bash
git pull
docker compose up -d --build
```

### Manual Backup / Restore

- **Manual Backup:** `docker exec budget-db pg_dump -U r budget > backup.sql`
- **Restore:** `cat backup.sql | docker exec -i budget-db psql -U r budget`

## Troubleshooting

- **Duplicates on Import:** The system now uses fingerprints. If you see duplicates, check the logs (`docker compose logs backend`) to see if fingerprints are colliding or being generated differently.
- **AI Categorization Slow:** The first few imports might be slow as the model trains on your data. This is normal and happens entirely inside the `backend` container.
