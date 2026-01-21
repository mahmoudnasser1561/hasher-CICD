#!/bin/bash

for i in {1..10}; do
    RESPONSE=$(curl -s --fail ${BACKEND_URL}/hash/test)
    if echo "$RESPONSE" | grep -q "098f6bcd4621d373cade4e832627b4f6"; then
        echo "Success!"
        exit 0
    else
        echo "Attempt $i: Not ready yet, retrying..."
        sleep 10
    fi
done

echo "Correct hash not found after retries!"
exit 1
