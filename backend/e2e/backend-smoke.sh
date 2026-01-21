#!/bin/bash
MAX_RETRIES=5

RETRY_DELAY=30  
for ((i=1; i<=MAX_RETRIES; i++)); do
    RESPONSE=$(curl -s --fail $BACKEND_URL/hash/test)
    if [ $? -eq 0 ] && echo "$RESPONSE" | grep -q "098f6bcd4621d373cade4e832627b4f6"; then
        echo "Success!"
        exit 0
    fi
    echo "Attempt $i failed. Retrying in $RETRY_DELAY seconds..."
    sleep $RETRY_DELAY
done
echo "Error: Failed after $MAX_RETRIES attempts. Response was '$RESPONSE'"
exit 1