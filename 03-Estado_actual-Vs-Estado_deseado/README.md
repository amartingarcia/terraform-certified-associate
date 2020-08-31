# 03 - Estado actual Vs Estado deseado
Cuando ejecutamos alguno de los sub-comandos _plan_ o _apply_, Terraform compara el estado actual (fichero `terraform.tfstate`), con el estado de lo que estamos enviando al a API del provider.

1. Partiendo de que tenemos los recursos creados.
```
terraform apply

aws_iam_user.lb: Refreshing state... [id=loadbalancer]

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
```

2. Modificamos el nombre del usuario.
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