#!/bin/bash

# Check for processing every 30s

while true; do
  /bin/bash ./EmailProcessing.sh
  sleep $1 
done
