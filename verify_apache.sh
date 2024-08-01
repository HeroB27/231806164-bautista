#!/bin/bash

# Check if Apache is running
if systemctl is-active --quiet apache2; then
    echo "Apache is running"
else
    echo "Apache is not running"
    exit 1
fi

# Check if Apache can serve a webpage
RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost)
if [ "$RESPONSE" -eq 200 ]; then
    echo "Apache is serving the webpage correctly"
else
    echo "Failed to load the webpage. HTTP Status Code: $RESPONSE"
    exit 1
fi
