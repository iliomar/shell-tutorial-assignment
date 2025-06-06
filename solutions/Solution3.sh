#!/bin/bash

echo "Starting log analysis..."

# Find all .log files
log_files=$(find simulation_logs/ -type f -name "*.log")

if [[ -z "$log_files" ]]; then
  echo "No log files found in simulation_logs/."
  exit 1
fi

# Count total log files found
num_files=$(echo "$log_files" | wc -l)
echo "Total log files found: $num_files"

error_files=0
warning_files=0

# Loop over files to find errors and warnings
for file in $log_files; do
  error_count=$(grep -c "ERROR" "$file")
  warning_count=$(grep -c "WARNING" "$file")

  if [[ $error_count -gt 0 ]]; then
    echo "File '$file' contains $error_count ERROR lines."
    ((error_files++))
  fi
  if [[ $warning_count -gt 0 ]]; then
    ((warning_files++))
  fi
done

echo "Number of files with ERROR: $error_files"
echo "Number of files with WARNING: $warning_files"

# Extract all ERROR lines into all_errors.txt
echo "Extracting all ERROR lines into all_errors.txt..."
> all_errors.txt  # Empty the file first

for file in $log_files; do
  grep "ERROR" "$file" >> all_errors.txt
done

# (Optional) Show top 5 most common error messages
if [[ -s all_errors.txt ]]; then
  echo "Top 5 most common error messages:"
  cut -d':' -f2- all_errors.txt | sort | uniq -c | sort -nr | head -n 5
else
  echo "No ERROR lines found, skipping top error messages."
fi

echo "Log analysis completed."

