# 02 - Mis primeros recursos
Si no lo indicas, terraform tratará de llevar al estado deseado, todos los recursos del directorio de trabajo. 
Pero es posible indicar uno o varios recuros exclusivamente, tanto para la creación como para la destrucción.

1. Creación de solo un recurso.
```
terraform apply --target=aws_iam_group.developers

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_group.developers will be created
  + resource "aws_iam_group" "developers" {
      + arn       = (known after apply)
      + id        = (known after apply)
      + name      = "developers"
      + path      = "/users/"
      + unique_id = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.


Warning: Resource targeting is in effect

You are creating a plan with the -target option, which means that the result
of this plan may not represent all of the changes requested by the current
configuration.

The -target option is not for routine use, and is provided only for
exceptional situations such as recovering from errors or mistakes, or when
Terraform specifically suggests to use it as part of an error message.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: 
```
2. Creación de dos recursos
```
terraform apply --target=aws_iam_group.developers --target=aws_iam_user.lb

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_group.developers will be created
  + resource "aws_iam_group" "developers" {
      + arn       = (known after apply)
      + id        = (known after apply)
      + name      = "developers"
      + path      = "/users/"
      + unique_id = (known after apply)
    }

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

Plan: 2 to add, 0 to change, 0 to destroy.


Warning: Resource targeting is in effect

You are creating a plan with the -target option, which means that the result
of this plan may not represent all of the changes requested by the current
configuration.

The -target option is not for routine use, and is provided only for
exceptional situations such as recovering from errors or mistakes, or when
Terraform specifically suggests to use it as part of an error message.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: 
```
3. Eliminación de un recurso
```
terraform destroy --target=aws_iam_group.developersaws_iam_group.developers: Refreshing state... [id=developers]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_iam_group.developers will be destroyed
  - resource "aws_iam_group" "developers" {
      - arn       = "arn:aws:iam::363131141369:group/users/developers" -> null
      - id        = "developers" -> null
      - name      = "developers" -> null
      - path      = "/users/" -> null
      - unique_id = "AGPAVJDCNPT4VZGIWMONQ" -> null
    }

Plan: 0 to add, 0 to change, 1 to destroy.


Warning: Resource targeting is in effect

You are creating a plan with the -target option, which means that the result
of this plan may not represent all of the changes requested by the current
configuration.

The -target option is not for routine use, and is provided only for
exceptional situations such as recovering from errors or mistakes, or when
Terraform specifically suggests to use it as part of an error message.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes
```
4. Eliminación de dos recursos
```
terraform destroy --target=aws_iam_group.developers --target=aws_iam_user.lb 
aws_iam_group.developers: Refreshing state... [id=developers]
aws_iam_user.lb: Refreshing state... [id=loadbalancer]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_iam_group.developers will be destroyed
  - resource "aws_iam_group" "developers" {
      - arn       = "arn:aws:iam::363131141369:group/users/developers" -> null
      - id        = "developers" -> null
      - name      = "developers" -> null
      - path      = "/users/" -> null
      - unique_id = "AGPAVJDCNPT4VZGIWMONQ" -> null
    }

  # aws_iam_user.lb will be destroyed
  - resource "aws_iam_user" "lb" {
      - arn           = "arn:aws:iam::363131141369:user/system/loadbalancer" -> null
      - force_destroy = false -> null
      - id            = "loadbalancer" -> null
      - name          = "loadbalancer" -> null
      - path          = "/system/" -> null
      - tags          = {
          - "tag-key" = "tag-value"
        } -> null
      - unique_id     = "AIDAVJDCNPT4ZOBWBYBTS" -> null
    }

Plan: 0 to add, 0 to change, 2 to destroy.


Warning: Resource targeting is in effect

You are creating a plan with the -target option, which means that the result
of this plan may not represent all of the changes requested by the current
configuration.

The -target option is not for routine use, and is provided only for
exceptional situations such as recovering from errors or mistakes, or when
Terraform specifically suggests to use it as part of an error message.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_iam_group.developers: Destroying... [id=developers]
aws_iam_user.lb: Destroying... [id=loadbalancer]
aws_iam_group.developers: Destruction complete after 0s
aws_iam_user.lb: Destruction complete after 1s

Warning: Applied changes may be incomplete

The plan was created with the -target option in effect, so some changes
requested in the configuration may have been ignored and the output values may
not be fully updated. Run the following command to verify that no other
changes are pending:
    terraform plan

Note that the -target option is not suitable for routine use, and is provided
only for exceptional situations such as recovering from errors or mistakes, or
when Terraform specifically suggests to use it as part of an error message.


Destroy complete! Resources: 2 destroyed.
```