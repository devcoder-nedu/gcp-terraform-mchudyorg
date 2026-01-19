# 1-org: Organization Hierarchy

This module creates the folder structure for the organization, separating environments (Dev, Prod) and layers (Networking, Projects).

## Structure Created

- **Foundation**
  - `networking` (Holds Shared VPC host projects)
- **Development**
  - `projects` (Holds Dev application projects)
- **Production**
  - `projects` (Holds Prod application projects)

## How to Reuse Folder IDs

The folder IDs created by this module are required by downstream modules (like `3-networks` and `4-projects`) to place resources in the correct location.

### Method 1: Manual Copy (Current Workflow)

1.  Run the output command in this directory:
    ```bash
    terraform output
    ```
2.  Copy the values printed in the terminal (e.g., `folder_id_networking = "folders/1234..."`).
3.  Paste them into the `terraform.tfvars` file of the destination module.

**Example `terraform.tfvars` for 3-networks:**

```hcl
folder_id_networking = "folders/1234567890"
```
