#!/bin/bash
set -e

cd /home/ubuntu/DevOps-Project-Two-Tier-Flask-App-using-AWS

echo "Pulling latest code..."
git pull

echo "Starting containers with Docker Compose..."
docker compose up -d --build

echo "Deployment completed."

