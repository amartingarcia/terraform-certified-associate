# Remote State Management
The ideal is to have our terraform code in a versioned repository.

## Sensitive data
To avoid storing sensitive data in our version control, we can use the file
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
The tfstate file is a very sensitive file and should not be a version control system, as sensitive data is reflected in it.
For this we can use the backens, and store the tfstates in multiple places, such as an S3
```
terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}
```

## Blocking the tfstate file
Terraform prevents multiple users from writing to the tfstate. When a write operation is launched against the tfstate, the file is blocked.

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

## Handling of TFSTATE
The tfstate file should never be edited by hand. The following actions can be carried out using terraform

| Subcomand | Description | Example |
|---|---|---|
| list | Allows to list the resources that are declared in the .tfsate| terraform state list |
| mv | Allows you to rename a resource | terraform state mv aws_iam_user.lb aws_iam_user.rds |
| pull | tfsate | terraform state pull |
| push | If modified by hand, the .tfsate file is rarely used | terraform state push |
| rm | Remove a resource from .tfsate | terraform state rm aws_iam_user.lb1|
| show | show resource code | terraform state show aws_iam_user.lb1|

## Importing resources
There may be a scenario where a resource has been created by hand, and you want to manage it with Terraform.
For this purpose, there is the __terraform import__ function, which allows you to add a manually created resource to the .tfstate file.


## Multi-region providers
We can make use of multiple providers, using different regions, by adding an alias and indicating on the resource where the provider will be created.


## Sensitive parameters
When using outputs, we can indicate which parameters are sensitive to prevent them from being displayed
```
output "instance_ip_addr" {
  value       = aws_instance.server.private_ip
  description = "The private IP address of the main server instance."
  sensitive   = true
}
```
