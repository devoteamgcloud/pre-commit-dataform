#!/bin/sh

# Check if dataform command is available
if ! command -v dataform >/dev/null 2>&1; then
  echo "Error: dataform command not found. Make sure it is installed and available in PATH."
  exit 1
fi

# Get the list of staged files
files=$(git diff --cached --name-only --diff-filter=ACM | grep '\.df$')

# Check if there are any Dataform files to format
if [ -z "$files" ]; then
  echo "No Dataform files to format. Skipping pre-commit hook."
  exit 0
fi

# Run Dataform formatting on each file
echo "Formatting Dataform files..."
for file in $files; do
  dataform fmt $file
  git add $file
done

echo "Dataform formatting complete. Please review the changes before committing."
exit 0
