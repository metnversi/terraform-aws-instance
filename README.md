# Some noting

- Just for learning AWS + Terraform.
- Terraform run by remote cloud, so you need go to your workspace, add variable `AWS_ACCESS_KEY_ID` and `AWS_ACCESS_SECRET_KEY` (which you get from AWS console or your admin)
- Anything related just refer to AWS docs and terraform docs.
- remember to change value in `main.tf` which should match your terraform `workspace` and else.
- Process: start with `aws configure`, publish your AWS access id and access password. Then init terraform by `terraform init`. Modify the approriate modules and run `terraform apply` to create the resources.

