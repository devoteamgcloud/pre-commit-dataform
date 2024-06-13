#!/bin/sh

# Check if dataform command is available, if not install it
if ! command -v dataform >/dev/null 2>&1; then
  echo "Dataform is not installed. Installing it now..."
  npm i -g @dataform/cli@latest
  echo "Dataform installed successfully."
fi

# Run Dataform formatting for SQLX files
dataform format

exit 0
