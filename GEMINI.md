# Agent Instructions for Running the Application Seamlessly

If a user asks you to "run the code", "start the app", or "run the repo seamlessly", please follow these precise instructions to save time and prevent port conflicts:

## 1. Do NOT use `docker-compose up --build` blindly for the app code
The repository is a monolithic application. Natively running it with `npm run dev` is much faster and more seamless than building Docker images for the application code.

## 2. Check for existing processes
Before starting, always check if processes are already running on ports `3004` (backend) or `5173` (frontend). If they are running in the background from a previous turn, **kill them** before attempting to restart the server natively, otherwise it will crash with an "Address already in use" error.

## 3. Database Setup (If Requested / First Time)
If the user wants the database started, migrated, and seeded:
1. `npm run db:start` (starts PostgreSQL in Docker via `docker compose up -d db`)
2. `npm run db:setup` (runs Flask DB migrations)
3. `npm run db:seed` (imports the seed data)

## 4. Running the Code (Native Seamless Runner)
The project includes a root `package.json` that uses `concurrently` to start both the Python backend and Vite frontend in a single terminal.

Execute:
```bash
npm run dev
```

To run the database setup, migration, seeding and the dev server all at once, you can run the `run_all.sh` command file:
```bash
./run_all.sh
```
Or you can use the npm command:
```bash
npm run dev:all
```

Run this command as a **background task** (if supported by your capabilities) so you can continue to assist the user while it runs. Wait for it to confirm both servers are listening (usually ports `3004` and `5173`) before telling the user the app is ready.
