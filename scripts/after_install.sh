#!/bin/bash

set -e  # Exit if any command fails

echo "🔧 [AfterInstall] Cleaning old app in /var/www/html..."
rm -rf /var/www/html/*

echo "🧱 [AfterInstall] Copying new build files..."
cp -r /home/ec2-user/app/dist/* /var/www/html/

echo "🧰 [AfterInstall] Updating Nginx config..."
cp /home/ec2-user/app/nginx.conf /etc/nginx/nginx.conf

echo "🔁 [AfterInstall] Restarting Nginx..."
systemctl restart nginx

echo "✅ [AfterInstall] Deployment complete."
