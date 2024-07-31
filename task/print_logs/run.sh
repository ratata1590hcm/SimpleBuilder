#!/bin/bash
ls -la
# Loop through all .log files in the current directory
for file in *.log; do
  # Check if there are any .log files
  if [ -e "$file" ]; then
    echo "==> $file <=="
    cat "$file"
    echo ""  # Add a newline for separation
  else
    echo "No .log files found in the current directory."
    break
  fi
done
