#!/bin/bash
echo "Validating nginx deployment..."

# Check if nginx is running
if ! systemctl is-active --quiet nginx; then
    echo "Error: Nginx is not running"
    exit 1
fi

# Check if we can access the default page
if ! curl -s --head http://localhost | grep "200 OK" > /dev/null; then
    echo "Error: Cannot access nginx webpage"
    exit 1
fi

echo "Nginx validation successful"
exit 0
