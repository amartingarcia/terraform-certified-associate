# Tainting

```
terraform apply

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_user.lb will be created
  + resource "aws_iam_user" "lb" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "loadbalancer"
      + path          = "/system/"
      + tags          = {
          + "tag-key" = "tag-value"
        }
      + unique_id     = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_iam_user.lb: Creating...
aws_iam_user.lb: Creation complete after 1s [id=loadbalancer]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
adrian@adrian:~/Documents/repositories/terraform_training/x-tainting|master⚡ ⇒  terraform taint aws_iam_user.lb
Resource instance aws_iam_user.lb has been marked as tainted.
adrian@adrian:~/Documents/repositories/terraform_training/x-tainting|master⚡ ⇒  terraform apply
aws_iam_user.lb: Refreshing state... [id=loadbalancer]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_iam_user.lb is tainted, so must be replaced
-/+ resource "aws_iam_user" "lb" {
      ~ arn           = "arn:aws:iam::363131141369:user/system/loadbalancer" -> (known after apply)
        force_destroy = false
      ~ id            = "loadbalancer" -> (known after apply)
        name          = "loadbalancer"
        path          = "/system/"
        tags          = {
            "tag-key" = "tag-value"
        }
      ~ unique_id     = "AIDAVJDCNPT43SRMZOV5O" -> (known after apply)
    }

Plan: 1 to add, 0 to change, 1 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: 
```
