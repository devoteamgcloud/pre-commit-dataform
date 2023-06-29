# Pre-commit hook for Dataform

This repository contains a pre-commit hook that allows you to automate the formatting of SQL and js code in your Dataform project before each commit. The hook uses the `dataform format` command to format SQLX and js files.

### How to Use

```
- repo: https://github.com/devoteamgcloud/pre-commit-dataform
  rev: [Fill with latest release]
  hooks:
    - id: dataform_format
```