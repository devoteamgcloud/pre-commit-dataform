#!/bin/sh

# Check if dataform command is available
if ! command -v dataform >/dev/null 2>&1; then
  echo "Error: dataform command not found. Make sure it is installed and available in PATH."
  exit 1
fi

dataform format

echo "Dataform formatting complete. Please review the changes before committing."
exit 0
