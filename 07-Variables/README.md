# 07 - Variables
Principalmente las variables se utilizan para los valores repetitivos, pero también pueden ser utilizadas para valores con mayor tendencia a cambios.

## Ejemplo de declaración de variables

## Asignación de variables
Una variable puede ser asignada o sobreescrita durante la ejecución de un _plan_ o un _apply_.
```
terraform plan -var="cidr=189.1.3.57/32"
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_security_group.allow_tls will be created
  + resource "aws_security_group" "allow_tls" {
      + arn                    = (known after apply)
      + description            = "Allow TLS inbound traffic"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "189.1.3.57/32",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "189.1.3.57/32",
                ]
              + description      = "TLS from VPC"
              + from_port        = 443
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 443
            },
          + {
              + cidr_blocks      = [
                  + "189.1.3.57/32",
                ]
              + description      = "TLS from VPC"
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
        ]
      + name                   = "allow_tls"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "allow_tls"
        }
      + vpc_id                 = "vpc-1234"
    }

Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```


## Variable como input
Si una variable es definida, pero no se le proporciona ningún valor, pedirá por pantalla establecer uno:

```
terraform plan                          
var.cidr
  Enter a value: 189.1.3.57/32 

Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_security_group.allow_tls will be created
  + resource "aws_security_group" "allow_tls" {
      + arn                    = (known after apply)
      + description            = "Allow TLS inbound traffic"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "189.1.3.57/32",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "189.1.3.57/32",
                ]
              + description      = "TLS from VPC"
              + from_port        = 443
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 443
            },
          + {
              + cidr_blocks      = [
                  + "189.1.3.57/32",
                ]
              + description      = "TLS from VPC"
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
        ]
      + name                   = "allow_tls"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "allow_tls"
        }
      + vpc_id                 = "vpc-1234"
    }

Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

## Precedencia de variables
Las variables pueden ser definidas en múltiples lugares, pero son ordenadas por precedencia.
- Variables de entorno
- Ficheros terraform.tfvars
- Ficheros terraform.tfvar.json
- Ficheros *.auto.tfvars o *.auto.tfvars.json
- Ficheros indicados por -var o -var-file
- Variables por defecto

## Variables de entorno
La declaración de la variable debe estar previamente definida.

En el fichero variables.tf, se define la variable cidr, si ejecutamos `terraform plan`, nos pedirá el valor de la variable por pantalla.
```
 terraform plan
var.cidr
  Enter a value: 
```

Para indicar el valor por medio de variables de entorno, se indica exportanto la variable TF_VAR_[nombre_variable], por ejemplo:
```
export TF_VAR_cidr="192.11.4.56/32"
```

Una vez definida, tras ejecutar el plan, podemos observar el comportamiento.
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

  # aws_security_group.allow_tls will be created
  + resource "aws_security_group" "allow_tls" {
      + arn                    = (known after apply)
      + description            = "Allow TLS inbound traffic"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "192.11.4.56/32",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "192.11.4.56/32",
                ]
              + description      = "TLS from VPC"
              + from_port        = 443
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 443
            },
          + {
              + cidr_blocks      = [
                  + "192.11.4.56/32",
                ]
              + description      = "TLS from VPC"
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
        ]
      + name                   = "allow_tls"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "allow_tls"
        }
      + vpc_id                 = "vpc-1234"
    }

Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```


## Ficheros terraform.tfvars o terraform.tfvar.json
Las buenas práticas de Terraform definen que se utilicen ficheros `.tfvars`, junto con valores por defecto.
Para entenderlo debemos jugar con los ficheros y sus valores:

* Terraform plan, con definición de variable y valor en _variables.tf_:
````
terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_security_group.allow_tls will be created
  + resource "aws_security_group" "allow_tls" {
      + arn                    = (known after apply)
      + description            = "Allow TLS inbound traffic"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "192.11.4.56/32",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "192.11.4.56/32",
                ]
              + description      = "TLS from VPC"
              + from_port        = 443
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 443
            },
          + {
              + cidr_blocks      = [
                  + "192.11.4.56/32",
                ]
              + description      = "TLS from VPC"
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
        ]
      + name                   = "allow_tls"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "allow_tls"
        }
      + vpc_id                 = "vpc-1234"
    }

Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
````

* Terraform plan, con definición de variable y valor en _variables.tf_, y fichero __terraform.tfvars__:
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

  # aws_security_group.allow_tls will be created
  + resource "aws_security_group" "allow_tls" {
      + arn                    = (known after apply)
      + description            = "Allow TLS inbound traffic"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "11.11.11.11/32",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "11.11.11.11/32",
                ]
              + description      = "TLS from VPC"
              + from_port        = 443
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 443
            },
          + {
              + cidr_blocks      = [
                  + "11.11.11.11/32",
                ]
              + description      = "TLS from VPC"
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
        ]
      + name                   = "allow_tls"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "allow_tls"
        }
      + vpc_id                 = "vpc-1234"
    }

Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

* Terraform plan, con definición de variable y valor en _variables.tf_, y fichero __terraform.tfvars.json__:
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

  # aws_security_group.allow_tls will be created
  + resource "aws_security_group" "allow_tls" {
      + arn                    = (known after apply)
      + description            = "Allow TLS inbound traffic"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "11.11.11.12/32",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "11.11.11.12/32",
                ]
              + description      = "TLS from VPC"
              + from_port        = 443
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 443
            },
          + {
              + cidr_blocks      = [
                  + "11.11.11.12/32",
                ]
              + description      = "TLS from VPC"
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
        ]
      + name                   = "allow_tls"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "allow_tls"
        }
      + vpc_id                 = "vpc-1234"
    }

Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```


## Ficheros *.auto.tfvars o *.auto.tfvars.json
Son ficheros con valores de variables, que se cargan automáticamente y en orden alfabético.

## Ficheros indicados por -var o -var-file
Puede darse el escenario de que queramos definir una variable en runtime, o que queramos indicar un fichero con variables.

* Variable en runtime
```
terraform plan -var="cidr=1.2.3.4/32"
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_security_group.allow_tls will be created
  + resource "aws_security_group" "allow_tls" {
      + arn                    = (known after apply)
      + description            = "Allow TLS inbound traffic"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "1.2.3.4/32",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "1.2.3.4/32",
                ]
              + description      = "TLS from VPC"
              + from_port        = 443
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 443
            },
          + {
              + cidr_blocks      = [
                  + "1.2.3.4/32",
                ]
              + description      = "TLS from VPC"
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
        ]
      + name                   = "allow_tls"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "allow_tls"
        }
      + vpc_id                 = "vpc-1234"
    }

Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

* Variables a partir de un fichero
```
terraform plan -var-file=custom.tfvars
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_security_group.allow_tls will be created
  + resource "aws_security_group" "allow_tls" {
      + arn                    = (known after apply)
      + description            = "Allow TLS inbound traffic"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "158.1.1.5/32",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "158.1.1.5/32",
                ]
              + description      = "TLS from VPC"
              + from_port        = 443
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 443
            },
          + {
              + cidr_blocks      = [
                  + "158.1.1.5/32",
                ]
              + description      = "TLS from VPC"
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
        ]
      + name                   = "allow_tls"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "allow_tls"
        }
      + vpc_id                 = "vpc-1234"
    }

Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```


## Variables por defecto
Es recomendable definir un valor por defecto para nuestro código, e indicar o definir un fichero .tfvars para los valores.
En caso contrario, y que no se defina un fichero con variables, el valor, será el de por defecto
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

  # aws_security_group.allow_tls will be created
  + resource "aws_security_group" "allow_tls" {
      + arn                    = (known after apply)
      + description            = "Allow TLS inbound traffic"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "192.11.4.56/32",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "192.11.4.56/32",
                ]
              + description      = "TLS from VPC"
              + from_port        = 443
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 443
            },
          + {
              + cidr_blocks      = [
                  + "192.11.4.56/32",
                ]
              + description      = "TLS from VPC"
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
        ]
      + name                   = "allow_tls"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "allow_tls"
        }
      + vpc_id                 = "vpc-1234"
    }

Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```
