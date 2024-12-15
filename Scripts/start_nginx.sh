#!/bin/bash
set -e  # Exit on any error

echo "Starting nginx service..."
sudo systemctl start nginx

echo "Verifying /usr/share/nginx/html/index.html exists..."
if [ ! -f "/usr/share/nginx/html/index.html" ]; then
    echo "Error: index.html not found!"
    exit 1
fi

echo "Reloading nginx configuration..."
sudo systemctl reload nginx
echo "Nginx started and configured successfully"
