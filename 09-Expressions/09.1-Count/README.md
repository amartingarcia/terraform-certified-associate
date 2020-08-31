# Count
Todos los recursos, admiten la propiedad __count__, es manejada por terraform, y permite indicar el número de elementos que será creados para el recurso.

* Count
Añadiendo `count = 5`, en el recurso para crear un usuario, podemos ver como el recurso se creará 5 veces.

```
terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_user.lb[0] will be created
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

  # aws_iam_user.lb[1] will be created
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

  # aws_iam_user.lb[2] will be created
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

  # aws_iam_user.lb[3] will be created
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

  # aws_iam_user.lb[4] will be created
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

Plan: 5 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

* Count index
Es posible que necesitamos acceder al indice de cada recurso creado con anterioridad, para diferenciar cada recurso.

```
terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_user.lb[0] will be created
  + resource "aws_iam_user" "lb" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "loadbalancer.0"
      + path          = "/system/"
      + tags          = {
          + "tag-key" = "tag-value"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.lb[1] will be created
  + resource "aws_iam_user" "lb" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "loadbalancer.1"
      + path          = "/system/"
      + tags          = {
          + "tag-key" = "tag-value"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.lb[2] will be created
  + resource "aws_iam_user" "lb" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "loadbalancer.2"
      + path          = "/system/"
      + tags          = {
          + "tag-key" = "tag-value"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.lb[3] will be created
  + resource "aws_iam_user" "lb" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "loadbalancer.3"
      + path          = "/system/"
      + tags          = {
          + "tag-key" = "tag-value"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.lb[4] will be created
  + resource "aws_iam_user" "lb" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "loadbalancer.4"
      + path          = "/system/"
      + tags          = {
          + "tag-key" = "tag-value"
        }
      + unique_id     = (known after apply)
    }

Plan: 5 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

* Podemos utilizarlo para recorrer un indice de variables:

```
erraform plan

Error: Invalid value for input variable

  on terraform.tfvars line 1:
   1: user_paths = ["user1", "user2", "user3"]

The given value is not valid for variable "user_paths": string required.

adrian@adrian:~/Documents/repositories/terraform_training/09-Count|master⚡ ⇒  terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_user.lb[0] will be created
  + resource "aws_iam_user" "lb" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "loadbalancer.0"
      + path          = "user1"
      + tags          = {
          + "tag-key" = "tag-value"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.lb[1] will be created
  + resource "aws_iam_user" "lb" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "loadbalancer.1"
      + path          = "user2"
      + tags          = {
          + "tag-key" = "tag-value"
        }
      + unique_id     = (known after apply)
    }

  # aws_iam_user.lb[2] will be created
  + resource "aws_iam_user" "lb" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "loadbalancer.2"
      + path          = "user3"
      + tags          = {
          + "tag-key" = "tag-value"
        }
      + unique_id     = (known after apply)
    }

Plan: 3 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```



