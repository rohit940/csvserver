#!/bin/bash

# Check if exactly 2 arguments are passed
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <start_index> <end_index>"
  exit 1
fi

start=$1
end=$2
output_file="inputFile"

# Check if start is less than or equal to end
if [ "$start" -gt "$end" ]; then
  echo "Error: start_index should be less than or equal to end_index."
  exit 1
fi

# Clear or create the file
> "$output_file"

# Generate random entries with index
for (( i=start; i<=end; i++ )); do
  rand=$((RANDOM % 1000))  # Random number between 0 and 999
  echo "$i, $rand" >> "$output_file"
done

echo "File '$output_file' generated with entries from $start to $end."

