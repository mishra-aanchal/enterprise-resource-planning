# Agent Instructions for Running the Application Seamlessly

If a user asks you to "run the code", "start the app", or "run the repo seamlessly", please follow these precise instructions to save time and prevent port conflicts:

## 1. Do NOT use `docker-compose up --build` blindly for the app code
The repository is a monolithic application. Natively running it with `npm run dev` is much faster and more seamless than building Docker images for the application code.

## 2. Check for existing processes
Before starting, always check if processes are already running on ports `3004` (backend) or `5173` (frontend). If they are running in the background from a previous turn, **kill them** before attempting to restart the server natively, otherwise it will crash with an "Address already in use" error.

## 3. Mandatory Setup (ALWAYS RUN THIS FIRST)
When starting a fresh project, you MUST execute the setup script first:
```bash
npm run setup
```
This handles installing root dependencies (like `concurrently`), frontend dependencies, creating the Python virtual environment, generating the `.env` file, and running the database migrations/seeds. If you skip this, `npm run dev` will fail with errors like `concurrently: command not found`.

## 4. Running the Code (Native Seamless Runner)
The project includes a root `package.json` that uses `concurrently` to start both the Python backend and Vite frontend in a single terminal.

Execute:
```bash
npm run dev
```

Run this command as a **background task** (if supported by your capabilities) so you can continue to assist the user while it runs. Wait for it to confirm both servers are listening (usually ports `3004` and `5173`) before telling the user the app is ready.
