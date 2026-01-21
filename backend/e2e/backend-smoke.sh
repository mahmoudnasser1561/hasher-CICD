#!/bin/bash

RESPONSE=$(curl -s --fail $BACKEND_URL/hash/test)
if echo "$RESPONSE" | grep -q "098f6bcd4621d373cade4e832627b4f6"; then
    echo "Success!"
    exit 0
else
    echo "Error"
    exit 1
fi