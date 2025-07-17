#!/bin/bash

echo "🛑 Stopping nginx if running..."
sudo systemctl stop nginx || true

echo "🧼 Cleaning previous vite-app directory if exists..."
sudo rm -rf /home/ec2-user/vite-app
