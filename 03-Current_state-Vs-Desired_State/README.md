# 03 - Current Status Vs Desired Status
When we execute any of the _plan_ or _apply_ sub-commands, Terraform compares the current status (file `terraform.tfstate`), with the status of what we are sending to the provider's API.

Starting from the fact that we have the resources created.
```
terraform apply

aws_iam_user.lb: Refreshing state... [id=loadbalancer]

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
```

2. We modify the user's name.
```
terraform apply
aws_iam_user.lb: Refreshing state... [id=loadbalancer]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # aws_iam_user.lb will be updated in-place
  ~ resource "aws_iam_user" "lb" {
        arn           = "arn:aws:iam::363131141369:user/system/loadbalancer"
        force_destroy = false
        id            = "loadbalancer"
      ~ name          = "loadbalancer" -> "loadbalancer2"
        path          = "/system/"
        tags          = {
            "tag-key" = "tag-value"
        }
        unique_id     = "AIDAVJDCNPT4YUCRL4EEL"
    }

Plan: 0 to add, 1 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.
```