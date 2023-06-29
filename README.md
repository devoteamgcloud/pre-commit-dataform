# Pre-commit hook for Dataform

This repository contains a pre-commit hook that allows you to automate the formatting of SQL code in your Dataform project before each commit. The hook uses the dataform format command to format SQLX files.

### How to Use

```
- repo: https://github.com/hrialan/pre-commit-dataform
  rev: v1.0.0
  hooks:
    - id: dataform_format
```