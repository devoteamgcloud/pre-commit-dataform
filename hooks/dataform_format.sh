#!/bin/sh

# Check if dataform command is available
if ! command -v dataform >/dev/null 2>&1; then
  echo "Error: dataform command not found. Make sure it is installed. Refer to the official Dataform documentation for installation instructions: https://cloud.google.com/dataform/docs/use-dataform-cli#install_cli"
  exit 1
fi

# Run Dataform formatting for SQLX files
dataform format

exit 0
