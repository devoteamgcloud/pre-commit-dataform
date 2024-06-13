#!/bin/sh

# Check if dataform command is available, if not install it
if ! command -v dataform >/dev/null 2>&1; then
  echo "Dataform is not installed."
  echo "Trying to install Dataform..."
  npm i -g @dataform/cli@latest
  echo "Dataform installed successfully."
fi

dataform compile

exit 0
