#!/bin/bash
set -e  # Exit on any error
echo "Starting nginx installation..."
# Update system packages
sudo dnf update -y
# Install nginx
sudo dnf install nginx -y
# Enable nginx to start on boot
sudo systemctl enable nginx
# Create fresh html directory (Amazon Linux uses /usr/share/nginx/html)
if [ -d "/usr/share/nginx/html" ]; then
    echo "Backing up existing content..."
    sudo mv /usr/share/nginx/html /usr/share/nginx/html_backup_$(date +%s)
fi
sudo mkdir -p /usr/share/nginx/html
sudo chown -R ec2-user:ec2-user /usr/share/nginx/html
echo "Nginx installation completed successfully"
