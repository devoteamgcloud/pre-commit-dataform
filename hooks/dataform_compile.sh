#!/bin/sh

# Check if dataform command is available, if not install it
if ! command -v dataform >/dev/null 2>&1; then
  echo "Dataform is not installed."
  echo "Trying to install Dataform..."
  if npm i -g @dataform/cli@latest; then
    echo "Dataform installed successfully."
  else
    echo "Failed to install Dataform."
    exit 1
  fi
fi

dataform compile

if [[ $? -ne 0 ]]; then
  exit 1
else
  exit 0
fi
