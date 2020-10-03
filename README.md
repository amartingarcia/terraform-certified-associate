<<<<<<< HEAD
# Hashicorp Terraform Certified Associate
=======
# terraform-certified-associate
>>>>>>> 424c608f410cde02eaf728c4d0762d3f599dc26d

The following official points of the documentation have been taken into account for the preparation of the exam:
- https://learn.hashicorp.com/tutorials/terraform/associate-review?in=terraform/certification


# Table of contents:
- [terraform_training](#terraform_training)
- [Tabla de contenidos](#tabla-de-contenidos)
- [Introducción](#introducción)
- [Casos de uso](#casos-de-uso)
- [Lenguaje de configuración](#lenguaje-de-configuración)
  - [Recursos y módulos](#recursos-y-módulos)
  - [Argumentos, bloques y expresiones](#argumentos-bloques-y-expresiones)
  - [Organización de código](#organización-de-código)
  - [Configuración de ordenación](#configuración-de-ordenación)
  - [Terraform CLI vs otros providers](#terraform-cli-vs-otros-providers)
- [Bloque de configuración](#bloque-de-configuración)
  - [Sintaxis](#sintaxis)
  - [Tipos de recursos](#tipos-de-recursos)
  - [Comportamiento de los recursos](#comportamiento-de-los-recursos)
  - [Meta-argumentos](#meta-argumentos)
  - [Recursos locales](#recursos-locales)
  - [Timeouts](#timeouts)
- [Terraform CLI](#terraform-cli)
  - [Ficheros de configuración](#ficheros-de-configuración)
  - [Variables de entorno](#variables-de-entorno)
    - [TF_LOG](#tf_log)
    - [TF_LOG_PATH](#tf_log_path)
    - [TF_INPUT](#tf_input)
    - [TF_VAR_name](#tf_var_name)
    - [TF_CLI_ARGS and TF_CLI_ARGS_name](#tf_cli_args-and-tf_cli_args_name)
    - [TF_DATA_DIR](#tf_data_dir)
    - [TF_IN_AUTOMATION](#tf_in_automation)
    - [TF_REGISTRY_DISCOVERY_RETRY](#tf_registry_discovery_retry)
    - [TF_REGISTRY_CLIENT_TIMEOUT](#tf_registry_client_timeout)
    - [TF_CLI_CONFIG_FILE](#tf_cli_config_file)
    - [TF_IGNORE](#tf_ignore)
  - [Comandos](#comandos)
- [Providers](#providers)
  - [Recursos necesarios](#recursos-necesarios)
  - [Recursos recomendados](#recursos-recomendados)



# Introduction
Terraform_ is a tool to build, change and version the infrastructure in a safe and efficient way, written in __Go__. Terraform can manage existing and popular service providers as well as customised internal solutions.

Configuration files describe to _Terraform_ the components needed to run a single application or your entire data centre. Terraform_ generates an execution plan that describes what it will do to achieve the desired state (_terraform plan_), and then executes it to build the described infrastructure. As the configuration changes, the Terraform is able to determine what has changed and create incremental execution plans that can be applied.

The infrastructure that _Terraform_ can manage includes low level components such as compute, storage and network instances, as well as high level components such as DNS entries, SaaS features, etc.

The main characteristics are:
- Infra-as-code: it allows to maintain the infrastructure as code, defining the code in __HLC__ (HashiCorp Configuration Language) or __JSON__.
- Executions Plans: allows to show what changes the infrastructure will suffer before being applied.
- Resource Graph: It allows the construction of infrastructure graphics.


# Use cases
The most common cases of use are as follows:
- Heroku App Setup: Can be used to encode the configuration ensuring that add-ons are available, configure DNSSimple, or configure Cloudflare without using a web interface.
- Multi-Tier Apps: With terraform resource collections can be described, and dependencies between levels will be handled automatically.
- Self-Service Clusters: With a certain organisational size, the operation becomes complex for a large and growing infrastructure. 
- Software Demos: <pending>
- Disposable Environments: It is possible to create and destroy ephemeral environments quickly, replicating a productive environment
- Software Defined Networking: <pending>
- Resource Schedulers: <pending>
- Multi-Cloud Deployment: Allows you to maintain code for several clouds, even creating dependencies between resources and clouds.



# Configuration language
Terraform uses its own language, it is declarative, describing a goal rather than the steps to reach it.

## Resources and modules
The main purpose is to declare the resources, the other characteristics exist only to make the definition of the resource more flexible and convenient.

A group of resources can be a module (_module_). 
> A resource describes a single infrastructure object, while a module can describe an object or a set of objects.

## Arguments, blocks and expressions
The syntax of the language is achieved in a few elements:

Skeleton of syntax:
```
<BLOCK TYPE> "<BLOCK LABEL>" "<BLOCK LABEL>" {
  # Block body
  <IDENTIFIER> = <EXPRESSION> # Argument
}
```

Example of syntax:
```
resource "aws_vpc" "main" {
  cidr_block = var.base_cidr_block
}
```

- Blocks (_Block_): These are containers for other containers, and usually represent the configuration of some type of object. They can have zero or more labels.
- Argument (_Argument_): Assigns a value to a name. They appear inside the blocks.
- Expressions: They represent a value, either literally or by reference or combination of other values.

## Code organization
Terraform files are named with the extension __.tf__. It is also possible to use _JSON_ language, using extension __.tf.json__
You must use the _UTF-8_ coding, and by convention are usually kept with Unix style linen (LF) finishes.

A module is a collection of __.tf__ or __tf.json__ files held together in a directory.

## Sorting configuration
Because the configuration language is declarative, the order of the blocks is not significant.
> The order of the blocks of __provisioners__ is the only important feature where order matters.

Terraform processes the resources in the correct order, based on the relationships defined between them in the configuration. 

## Terraform CLI vs other providers
Terraform CLI, is an engine for evaluating and applying Terraform configurations.

This general engine has no knowledge of specific object types. Instead, Terraform uses plugins called __providers__ that define and manage each set of resource types.


# Configuration block
Resources are the most important element in the language of the Terraforma. Each resource block describes one or more infrastructure objects such as virtual networks, computer instances or higher level components such as DNS records.


## Syntax
<pending>
## Types of resources
<pending>
## Resource behaviour
<pending>
## Meta-arguments
<pending>
## Local resources
<pending>
## Timeouts
<pending>

# Terraform CLI
Terraform se controla a través de linea de comandos. Se puede ejecutar multitud de sub-comandos. 
Se muestra todos los subcomandos disponibles ejecutando:
```
terraform -h
```

Para obtener ayuda sobre cualquier sub-comando:
```
terraform plan -h
```

Para instalar el autocompletado:
```
terraform -install-autocomplete
```

## Configuration files
The CLI's behaviour can be configured, and they are applied in all Terraform working directories.

You can find __.terraformrc__ or __.terraform.rc__ files.

It is possible to indicate a configuration file, adding the path to the environment variable `TF_CLI_CONFIG_FILE`.

The configuration file uses the same language as the Terraform (HLC) files, and the available configurations are as follows:
- credentials
- credentials_helper
- diable_checkpoint
- disable_checkpoint_signature
- plugin_cache_dir
- provider_installation


## Environmental variables
Terraform supports environmental variables to change its behaviour, __ but none of these variables are necessary for its operation__.
The variables supported by Terraform are as follows:

### TF_LOG
Useful for Terraform debugging, the possible values are 'TRACE', 'DEBUG', 'INFO', 'WARN' or 'ERROR'. 
To disable it, simply declare the variable empty.

### TF_LOG_PATH
Path of the file where you will leave the logs, the variable `TF_LOG` must also be defined.

### TF_INPUT
When a terraform variable is not defined, a message is displayed on the terminal to indicate this. 
If the variable `TF_INPUT`, is set to `false` or `0`, the behaviour is disabled. 
It can be set on the command line by entering `-input=false`.

### TF_VAR_name
Instead of indicating the value in the Terraform code, it is possible to indicate the value, by means of environment variale. Previously, the variable must be defined.
For example:

```
export TF_VAR_region=us-west-1
export TF_VAR_ami=ami-049d8641
export TF_VAR_alist='[1,2,3]'
export TF_VAR_amap='{ foo = "bar", baz = "qux" }'

```

### TF_CLI_ARGS and TF_CLI_ARGS_name 
Allows you to specify additional arguments on the command line.
It is inserted directly after the sub-command and has priority over environment variables.

For example:
```
export TF_CLI_ARGS="-input=false"

When it is launched:
terraform apply -force

It is actually being launched:
terraform apply -input=false -force
```

It is possible to indicate that only one sub-command is affected. For example:

```
export TF_CLI_ARGS_plan="-refresh=false"
```

### TF_DATA_DIR
Allows you to indicate the location of the data in the working directory.
By default the data is written in the __.terraform__ directory of the current directory.

> This can be useful when the working directory is not editable.

### TF_IN_AUTOMATION
Modifies the output when used in an IC environment.

### TF_REGISTRY_DISCOVERY_RETRY
Allows you to set the maximum number of request retries.

### TF_REGISTRY_CLIENT_TIMEOUT
Second set for timeout, default '10s'.
```
export TF_REGISTRY_CLIENT_TIMEOUT=15
```

### TF_CLI_CONFIG_FILE
Location of the `.terraformrc' file.
```
export TF_CLI_CONFIG_FILE="$HOME/.terraformrc-custom"
```
### TF_IGNORE
If the value of the variable is 'TRACE', it will show debug, over file and ignored directories.

It is possible to create `.terraformignore` files, to determine what type of files will be ignored in the execution.

## Commands
All the sub-commands that can be launched with terraform are as follows

| command | Usage | description |
|---|---|---|
| apply | terraform apply [options] [dir-or-plan] | Used to apply changes to achieve the desired state |
| console | terraform console [options] [dir] | Interactive console for evaluating expressions |
| destroy | terraform destroy [options] [dir] | Destroy the infrastructure |
| fmt | terraform fmt [options] [DIR] | Rewrite files to a canonical format and style |
| force-unlock | terraform force-unlock LOCK_ID [DIR] | Manual release of the defined settings |
| get | terraform get [options] [dir] | Download and update the modules mentioned in the root module |
| graph | terraform graph [options] [DIR] | Generates a visual representation of a configuration plan, in DOT format and representable by GraphViz |
| import | terraform import [options] ADDRESS_ID | Import existing resources |
| init | terraform init [options] [DIR] | Initialize the working directory, e.g. by downloading the necessary 'providers
| login | terraform login [hostname] | Get and save a token for the Terraform Cloud API, Enterprise or other host |
| logout | terraform logout [hostname] | Remove token for Terraform Cloud API, Enterprise or other host |
| output | terraform output [options] [NAME] | Displays the output value of a variable defined in the 'State file' |
| plan | terraform plan [options] [dir] | Implementation plan. Allows you to know what modifications you will make to reach the desired state |
| providers | terraform providers [config-path] | Displays information about the 'providers' used in the current configuration |
| refresh | terraform refresh [options] [dir] | Align 'State file' with current status |
| show | terraform show [options] [path] | Display readable output on a 'State File' or 'Plan File' |
| state | terraform state <subcommand> [options] [args] | Allows you to modify the 'State File', or even to make backups of it
| taint | terraform taint [options] address | Allows to mark a resource to force its recreation in the next 'apply' |
| validate | terraform validate [options] [dir] | Validate configuration files, without accessing any remote service |
| untaint | terraform untaint [options] name | Allow to uncheck a resource that has been marked for recreation |
| workspace | terraform workspace <subcommand> [options] [args] | Used to manage workspaces |


# Providers
A _Provider_, is responsible for understanding the interactions of the API and for exposing its resources. 

The Terraform Registry__ is the main repository for the publicly available Terraform __Providers__.

You must indicate in your code the __provider__ or __providers__ to be used. 
When you run 'terraform init', it looks for the declared provider and downloads its plugin into the __.terraform__ directory of the working directory.

You can find the __providers__ managed by Terraform, on the official website.
https://www.terraform.io/docs/providers/index.html

## Resources needed
The first resource to indicate in our code will be the _provider_. For example, for AWS:

```
provider "aws" {
  region = "us-east-1"
  access_key = "PUT-YOUR-ACCESS-KEY-HERE
  secret_key = "PUT-YOUR-SECRET-KEY-HERE
}
```

> Credentials can be indicated as environment variables, as they would be used to interact with the platform, or in the resource itself

## Recommended resources
It is advisable, but not compulsory, to indicate some configurations to avoid problems in the provision of infrastructure.
The following configuration allows the provider version to be the latest '2.X.X' version. And it requires that the terraform version be equal or superior to version `0.12`.
```
provider "aws" {
  region = "us-east-1"
  version = "~> 2.55.0
}

terraform {
  required_version = ">= 0.12"
}
```

# Exercises
The following exercises have been planned to acquire the necessary knowledge for certification.

| Index | Link | Description |
|---|---|---|
<<<<<<< HEAD
| 01 | [My first resource](01-Mi_first_resource/README.md) | Creating a single resource
| 02 | [My first resources](02-My_first_resources_v2/README.md) | Creating various resources |
| 03 | [Current Status VS Desired Status](03-Current_State-Vs-Desired_State/README.md) | Examples of .tfstate, current status and desired status |
| 04 | [Providers](04-Providers/README.md) | Examples of Providers |
| 05 | [Outputs](05-Outputs/README.md) | Examples of Outputs
| 06 | [Outputs V2](06-Outputs-V2/README.md) | Example of outputs between .tfstate
| 07 | [Variables](07-Variables/README.md) | Example of variables |
| 08 | [Data types](08-Data-types/README.md) | Data types example |
| 09 | [Expressions](09-Expressions/README.md) | Example of Expressions |
| 10 | [Local values](10-Local_values/README.md) | Example of local values
| 11 | [Provisioners](11-Provisioners/README.md) | Example of Provisioners |
| 12 | [Modules](12-Modules/README.md) | Example of Modules |
| 13 | [Data sources](13-Data-sources/README.md) | Data Sources Example |
| 14 | [Registry](14-Registry/README.md) | Example of Registry |
| 15 | [Workspace](15-Workspaces/README.md) | Workspace example |
| 16 | [Remote state management](16-Remote-State-Management/README.md) | Examples of remote state management |
| 17 | [Dynamic blocks](17-dynamic-blocks/README.md) | Example of operation with dynamic blocks |
| 18 | [Taiting](18-tainting/README.md) | Example of Taiting |
| 19 | [Terraform Graph](19-terraform-graph/README.md) | Example of graph creation |
| 20 | [Vault](20-vault/README.md) | Example with Vault
=======
| 01  | [Mi primer recurso](01-Mi_primer_recurso/README.md)  | Creación de un único recurso  |
| 02  | [Mis primeros recursos](02-Mis_primeros_recursos/README.md)  | Creación de varios recursos  |
| 03  | [Estado actual VS Estado deseado](03-Estado_actual-Vs-Estado_deseado/README.md)  | Ejemplos de .tfstate, estado actual y estado deseado  |
| 04  | [Providers](04-Providers/README.md)  | Ejemplos de Providers |
| 05  | [Outputs](05-Outputs/README.md)  | Ejemplos de Outputs  |
| 06  | [Outputs V2](06-Outputs-V2/README.md)  | Ejemplo de outputs entre .tfstate  |
| 07  | [Variables](07-Variables/README.md)  | Ejemplo de variables  |
| 08  | [Data types](08-Data-types/README.md)  | Ejemplo de Data types  |
| 09  | [Expressions](09-Expressions/README.md)  | Ejemplo de Expressions  |
| 10  | [Local values](10-Local_values/README.md)  | Ejemplo de valores locales  |
| 11  | [Provisioners](11-Provisioners/README.md)  | Ejemplo de Provisioners  |
| 12  | [Modules](12-Modules/README.md)  | Ejemplo de Modulos  |
| 13  | [Data sources](13-Data-sources/README.md)  | Ejemplo de Data Sources |
| 14  | [Registry](14-Registry/README.md)  | Ejemplo de Registry |
| 15  | [Workspace](15-Workspaces/README.md)  | Ejemplo de Workspace |
| 16  | [Remote state management](16-Remote-State-Management/README.md)  | Ejemplos de manejo con el state remoto  |
| 17  | [Dynamic blocks](17-dynamic-blocks/README.md)  | Ejemplo de manejo con bloques dinámicos  |
| 18  | [Taiting](18-tainting/README.md)  | Ejemplo de Taiting  |
| 19  | [Terraform Graph](19-terraform-graph/README.md)  | Ejemplo de creación de gráficos  |
| 20  | [Vault](20-vault/README.md)  | Ejemplo con Vault  |
>>>>>>> 424c608f410cde02eaf728c4d0762d3f599dc26d
