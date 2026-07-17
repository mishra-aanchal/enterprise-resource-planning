#!/bin/bash
echo "Starting Database..."
npm run db:start

echo "Running DB Migrations..."
npm run db:setup

echo "Seeding Database..."
npm run db:seed

echo "Starting Application Servers..."
npm run dev
