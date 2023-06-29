#!/bin/sh

# Check if dataform command is available
if ! command -v dataform >/dev/null 2>&1; then
  echo "Error: dataform command not found. Make sure it is installed and available in PATH."
  exit 1
fi

# Run Dataform formatting
output=$(dataform format 2>&1)
exit_code=$?

if [ $exit_code -ne 0 ]; then
  echo "Dataform formatting failed:"
  echo "$output"
  echo "Please review the formatting errors before committing."
  exit 1
fi

echo "Dataform formatting complete. Please review the changes before committing."
