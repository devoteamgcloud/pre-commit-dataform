#!/bin/bash

# Test script for pre-commit-dataform hooks

set -e

REPO_ROOT=$(pwd)
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
