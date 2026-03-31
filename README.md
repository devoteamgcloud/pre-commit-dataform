# Pre-commit hook for Dataform

This repository contains pre-commit hooks to automate checks for Dataform projects before each commit. 

## Requirements

- **Dataform CLI**: You must have the [Dataform CLI](https://cloud.google.com/dataform/docs/use-dataform-cli) installed locally in your environment for these hooks to function, as they depend on the `dataform` executable.
- **Node.js**: It's recommended to use Node.js v20 or lower, as newer versions (like v22+) might be incompatible with current Dataform CLI dependencies.

## Available Hooks

### `dataform_format`
This hook automates the formatting of SQL and JS code in your Dataform project. It runs the `dataform format` command against your `.sqlx` and `.js` files, ensuring consistent code style across your repository.

### `dataform_compile`
This hook runs the `dataform compile` command before each commit to ensure that your Dataform project compiles successfully. It acts as an early validation step to prevent pushing broken definitions to your repository.

## How to Use

Add the following configuration to your project's `.pre-commit-config.yaml` file:

```yaml
- repo: https://github.com/devoteamgcloud/pre-commit-dataform
  rev: [Fill with latest release tag]
  hooks:
    - id: dataform_format
    - id: dataform_compile
```