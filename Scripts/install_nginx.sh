#!/bin/bash
sudo yum update -y
sudo yum install -y nginx
sudo systemctl enable nginx
mkdir -p /var/www/html
