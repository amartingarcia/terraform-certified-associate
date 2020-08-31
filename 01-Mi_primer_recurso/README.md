# 01 - Mi primer recurso
En este primer ejemplo, mostramos como crear un usuario en AWS.

1. Ejecutaremos `terraform init`:
Descargará el provider indicado, para interactuar con la plataforma

```
Initializing the backend...

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "aws" (hashicorp/aws) 2.55.0...

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

2. Ejecutamos terraform plan:
Al ejecutar el plan, se crearán un fichero en el directorio de trabajo `terraform.tfstate` (Almacena el estado de la infraestructura).
Por ello durante el plan, el fichero se encuentra vacio.
```
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

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

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

3. Ejecutamos `terraform apply`:
Esta ejecución, permite llevar el estado de la infraestructura, al estado deseado.

```
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
```

Una vez aplicado, nos fijamos en el fichero `terraform.tfstate`, tendrá una definición de los recursos creados.
> __IMPORTANTE__: Este fichero nunca debe ser editado a mano.

