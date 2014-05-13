#!/bin/bash

# Check for processing every 30s

while true; do
  /home/EmailProcessing.sh
  sleep $1 
done
