# 05 - Outputs
Los atributos Outputs, no solo sirven para darnos información sobre los recursos creados.
También pueden ser consumidos por otros recursos.

En el ejemplo vamos a crear un grupo, un usuario, y la unión entre ellos.

1. Creamos el grupo
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

  Enter a value: yes

aws_iam_group.developers: Creating...
aws_iam_group.developers: Creation complete after 1s [id=developers]

Warning: Applied changes may be incomplete

The plan was created with the -target option in effect, so some changes
requested in the configuration may have been ignored and the output values may
not be fully updated. Run the following command to verify that no other
changes are pending:
    terraform plan

Note that the -target option is not suitable for routine use, and is provided
only for exceptional situations such as recovering from errors or mistakes, or
when Terraform specifically suggests to use it as part of an error message.


Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

2. Creamos el usuario
```
terraform apply --target=aws_iam_user.lb 

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

  Enter a value: yes

aws_iam_user.lb: Creating...
aws_iam_user.lb: Creation complete after 1s [id=loadbalancer]

Warning: Applied changes may be incomplete

The plan was created with the -target option in effect, so some changes
requested in the configuration may have been ignored and the output values may
not be fully updated. Run the following command to verify that no other
changes are pending:
    terraform plan

Note that the -target option is not suitable for routine use, and is provided
only for exceptional situations such as recovering from errors or mistakes, or
when Terraform specifically suggests to use it as part of an error message.


Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

3. Unir un usuario y un grupo. 
Existe un recurso llamado `aws_iam_group_membership`, permite la unión entre un usuario y un grupo.

Si nos fijamos en la documentación:
> The following arguments are supported:
> name - (Required) The name to identify the Group Membership
> users - (Required) A list of IAM User names to associate with the Group
> group – (Required) The IAM Group name to attach the list of users to

Por lo tanto necesitamos el nombre del usuario y el nombre del grupo.

Si nos fijamos en la creación de los recuros anteriormente creados, podemos observar que en la salida nos muestra que los recursos tienen un atributo nombre.
Se puede hacer referencia a ese atributo, componiendo recurso.nombre_recurso.atributo, para la creación de nuestro recurso:

```
resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.lb.name,
  ]

  group = aws_iam_group.developers.name
}
```

```
terraform apply                                  
aws_iam_group.developers: Refreshing state... [id=developers]
aws_iam_user.lb: Refreshing state... [id=loadbalancer]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_group_membership.team will be created
  + resource "aws_iam_group_membership" "team" {
      + group = "developers"
      + id    = (known after apply)
      + name  = "tf-testing-group-membership"
      + users = [
          + "loadbalancer",
        ]
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_iam_group_membership.team: Creating...
aws_iam_group_membership.team: Creation complete after 1s [id=tf-testing-group-membership]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```