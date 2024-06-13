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

# Compute hash of all files in the project before and after formatting to detect changes

hash_before_format=$(find ./definitions ./includes -type f -exec md5sum {} \; | awk '{print $1}' | sort | md5sum | awk '{print $1}')

dataform format

hash_after_format=$(find ./definitions ./includes -type f -exec md5sum {} \; | awk '{print $1}' | sort | md5sum | awk '{print $1}')

if [ "$hash_before_format" != "$hash_after_format" ]; then
    exit 1
else
    exit 0
fi
