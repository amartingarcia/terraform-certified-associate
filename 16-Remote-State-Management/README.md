# Remote State Management
Lo ideal es tener nuestro código de terraform en un repositorio versionado.

## Datos sensibles
Para evitar almacenar datos sensibles en nuestro control de veriones, podemos ayudarnos de la función file
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

  # aws_db_instance.default will be created
  + resource "aws_db_instance" "default" {
      + address                               = (known after apply)
      + allocated_storage                     = 20
      + apply_immediately                     = (known after apply)
      + arn                                   = (known after apply)
      + auto_minor_version_upgrade            = true
      + availability_zone                     = (known after apply)
      + backup_retention_period               = (known after apply)
      + backup_window                         = (known after apply)
      + ca_cert_identifier                    = (known after apply)
      + character_set_name                    = (known after apply)
      + copy_tags_to_snapshot                 = false
      + db_subnet_group_name                  = (known after apply)
      + delete_automated_backups              = true
      + endpoint                              = (known after apply)
      + engine                                = "mysql"
      + engine_version                        = "5.7"
      + hosted_zone_id                        = (known after apply)
      + id                                    = (known after apply)
      + identifier                            = (known after apply)
      + identifier_prefix                     = (known after apply)
      + instance_class                        = "db.t2.micro"
      + kms_key_id                            = (known after apply)
      + license_model                         = (known after apply)
      + maintenance_window                    = (known after apply)
      + monitoring_interval                   = 0
      + monitoring_role_arn                   = (known after apply)
      + multi_az                              = (known after apply)
      + name                                  = "mydb"
      + option_group_name                     = (known after apply)
      + parameter_group_name                  = "default.mysql5.7"
      + password                              = (sensitive value)
      + performance_insights_enabled          = false
      + performance_insights_kms_key_id       = (known after apply)
      + performance_insights_retention_period = (known after apply)
      + port                                  = (known after apply)
      + publicly_accessible                   = false
      + replicas                              = (known after apply)
      + resource_id                           = (known after apply)
      + skip_final_snapshot                   = false
      + status                                = (known after apply)
      + storage_type                          = "gp2"
      + timezone                              = (known after apply)
      + username                              = "foo"
      + vpc_security_group_ids                = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```


## Remote state AWS
El fichero tfstate es un fichero muy delicado y que no debería estar un un sistema de control de veriones, ya que los datos sensibles se reflejan en el.
Para ello podemos utilizar los backens, y almacenar los tfstates en múltiples lugares, como por ejemplo un bucket de S3
```
terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}
```

## Bloqueo del fichero tfstate
Terraform evita que multiples usuarios escriban en el tfstate, cuando se lanza una operación de escritura contra el tfstate, el fichero es bloqueado.

```
terraform plan     

Error: Error locking state: Error acquiring the state lock: resource temporarily unavailable
Lock Info:
  ID:        7f850e0f-4962-e042-31ce-de7830832987
  Path:      terraform.tfstate
  Operation: OperationTypePlan
  Who:       @adrian.local
  Version:   0.13.0
  Created:   2020-08-24 12:20:12.312538 +0000 UTC
  Info:      


Terraform acquires a state lock to protect the state from being written
by multiple users at the same time. Please resolve the issue above and try
again. For most commands, you can disable locking with the "-lock=false"
flag, but this is not recommended.
```

## Manejo de TFSTATE
El fichero tfstate nunca debe editarse a mano, mediante terraform puede realizarse las siguientes acciones:

| Subcomand | Description | Example |
|---|---|---|
| list | Permite listar los recuros que está declarados en el .tfsate| terraform state list  |
| mv | Permite renombrar un recurso | terraform state mv aws_iam_user.lb aws_iam_user.rds  |
| pull | Muestra el fichero tfsate | terraform state pull |
| push | Si se modifica a mano, el fichero .tfsate, rara vez se utiliza | terraform state push |
| rm | Elimina un recurso del .tfsate | terraform state rm   aws_iam_user.lb1|
| show | Muestra el código del recurso | terraform state show  aws_iam_user.lb1|

## Importar recursos
Puede darse el escenario en el que se haya creado un recurso a mano, y quiera ser administrado con Terraform.
Para ello existe la función __terraform import__, que permite añadir al fichero .tfstate, un recurso creado manualmente.


## Providers multiregion
Podemos hacer uso de multiples providers, utilizando regiones distintas, añadiendo un alias e indican en el recurso en que provider se creará.


## Parámetros sensibles
Cuando hacemos uso de outputs, podemos indicar que parámetros son sensible para evitar que sean mostrados
```
output "instance_ip_addr" {
  value       = aws_instance.server.private_ip
  description = "The private IP address of the main server instance."
  sensitive   = true
}
```
