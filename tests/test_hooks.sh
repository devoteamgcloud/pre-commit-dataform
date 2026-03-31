#!/bin/bash

# Test script for pre-commit-dataform hooks

set -e

REPO_ROOT=$(pwd)

# Check Node.js version and try to use nvm if available
if [[ $(node -v) == v2[2-5]* ]]; then
    echo "Current Node.js version $(node -v) is known to be incompatible with Dataform CLI."
    export NVM_DIR="$HOME/.nvm"
    if [ -s "$NVM_DIR/nvm.sh" ]; then
        echo "Trying to switch to Node.js v20 using nvm..."
        source "$NVM_DIR/nvm.sh"
        nvm use 20 || nvm install 20
    else
        echo "Warning: No nvm found. Tests might fail."
    fi
fi

TEST_DIR=$(mktemp -d)

echo "Setting up test Dataform project in $TEST_DIR"
cp -r tests/dummy_project/* "$TEST_DIR/"
cd "$TEST_DIR"

echo "Running dataform_compile.sh..."
if "$REPO_ROOT/hooks/dataform_compile.sh"; then
    echo "dataform_compile.sh passed."
else
    echo "dataform_compile.sh failed unexpectedly."
    exit 1
fi

echo "Running dataform_format.sh..."
if "$REPO_ROOT/hooks/dataform_format.sh"; then
    echo "dataform_format.sh passed."
else
    echo "dataform_format.sh failed unexpectedly."
    exit 1
fi

echo "All tests passed!"
rm -rf "$TEST_DIR"
