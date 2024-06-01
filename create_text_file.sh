#!/bin/bash

# Name of the output file
output_file="demoa.txt"

# Create or empty the file if it already exists
> "$output_file"

# Loop to write 250 lines
for ((i = 1; i <= 250; i++)); do
  echo "line number #$i" >> "$output_file"
done

echo "File $output_file created with 250 lines."