#!/bin/bash

echo "✅ Updating packages..."
sudo yum update -y

echo "🧰 Installing NGINX..."
sudo yum install -y nginx

echo "🚀 Enabling and restarting NGINX..."
sudo systemctl enable nginx
sudo systemctl start nginx

echo "🧹 Cleaning old web content..."
sudo rm -rf /usr/share/nginx/html/*

echo "📦 Copying new build to NGINX root..."
sudo cp -r /home/ec2-user/app/dist/* /usr/share/nginx/html/

echo "✅ Deployment complete!"
