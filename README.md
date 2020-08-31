# terraform_training

Para la preparación del examen se ha tenido en cuenta los siguientes puntos oficiales de la documentación:
- https://learn.hashicorp.com/tutorials/terraform/associate-review?in=terraform/certification


# Tabla de contenidos
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



# Introducción
_Terraform_ es una herramienta para construir, cambiar y versionar la infraestructura de forma segura y eficiente, escrita en __Go__. Terraform puede gestionar los proveedores de servicios existentes y populares, así como soluciones internas personalizadas.

Los archivos de configuración describen a _Terraform_ los componentes necesarios para ejecutar una sola aplicación o todo su centro de datos. _Terraform_ genera un plan de ejecución que describe lo que hará para alcanzar el estado deseado (_terraform plan_), y luego lo ejecuta para construir la infraestructura descrita. A medida que la configuración cambia, _Terraform_ es capaz de determinar lo que ha cambiado y crear planes de ejecución incrementales que pueden ser aplicados.

La infraestructura que _Terraform_ puede gestionar incluye componentes de bajo nivel como instancias de cálculo, almacenamiento y redes, así como componentes de alto nivel como entradas DNS, características SaaS, etc.

Las caracteristicas principales son:
- Infra-as-code: permite mantener la infraestructura como código, definiendo el código en lenguaje __HLC__ (HashiCorp Configuration Language) o __JSON__.
- Executions Plans: permite mostrar que cambios va a sufrir la infraestructura antes de ser aplicados.
- Resource Graph: Permite la construcción de gráficos de infraestructura.


# Casos de uso
Los casos de uso más comunes son los siguientes:
- Heroku App Setup: Puede ser utilizado para codificar la configuración asegurandose que los add-ons estén disponbiles, configurar DNSSimple, o configurar Cloudflare sin usar interfaz web.
- Multi-Tier Apps: Con terraform pueden describirse colecciones de recursos, y las dependencias entre niveles se manejarán automáticamente.
- Self-Service Clusters: Con un cierto tamaño organizativo, se hace compleja la operación para una infraestructura grande y creciente. 
- Software Demos: <pendiente>
- Disposable Environments: Es posible crear y destruir entornos efímeros rápidamente, replicando un entorno productivo
- Software Defined Networking: <pendiente>
- Resource Schedulers: <pendiente>
- Multi-Cloud Deployment: Permite mantener código para varias nubes, creando incluso dependencias entre recursos y nubes.


# Lenguaje de configuración
Terraform utiliza su propio lenguaje, es declarativo, describiendo una meta en lugar de los pasos para alcanzarla.

## Recursos y módulos
El proposito principal es declarar los recursos, las demás características existen solo para hcer la definición del recurso más flexible y conveniente.

Un grupo de recursos puede ser un módulo (_module_). 
> Un recurso describe un solo objeto de infraestructura, mientras que un módulo puede describir un objeto o un conjunto de objetos.

## Argumentos, bloques y expresiones
La sintaxis del lenguaje, consigue en unos pocos elementos:

Esqueleto de sintaxis:
```
<BLOCK TYPE> "<BLOCK LABEL>" "<BLOCK LABEL>" {
  # Block body
  <IDENTIFIER> = <EXPRESSION> # Argument
}
```

Ejemplo de sintaxis:
```
resource "aws_vpc" "main" {
  cidr_block = var.base_cidr_block
}
```

- Bloques (_Block_): Son contenedores de otros contendos, y suelen representar la configuración del algún tipo de objeto. Pueden tener cero o más etiquetas.
- Argumentos (_Argument_): Asigna un valor a un nombre. Aparecen dentro de los bloques.
- Expresiones (_Expressions_): Representan un valor, ya sea literal o mediante la referencia o combinación de otros valores.

## Organización de código
Los ficheros de Terraform se nombran con la extensión __.tf__. También es posible utilizar lenguaje _JSON_, utilizando extensión __.tf.json__
Debe usar la codificación _UTF-8_, y por convención suelen mantenerse con terminanciones de lina estilo Unix (LF).

Un moódulo es una colección de archivos __.tf__ o __tf.json__ mantenidos juntos en un directorio.

## Configuración de ordenación
Debido a que el lenguaje de configuración es declarativo, el orden de los bloques no es significativo.
> El orden de los bloques de __provisioners__ es la única característica importante donde el orden importa.

Terraform procesa los recuros en el orden correcto, basado en las relaciones definidas entre ellos en la configuración. 

## Terraform CLI vs otros providers
Terraform CLI, es un motor para evaluar y aplicar las configuraciones de Terraform.

Este motor general no tiene conocimiento sobre tipos de objetos específicos. En su lugar, Terraform utiliza plugins llamados __providers__ que definen y adminstran cada conjunto de tipo de recursos.


# Bloque de configuración
Los recursos son el elemento más importante en el lenguaje de la Terraforma. Cada bloque de recursos describe uno o más objetos de infraestructura, como redes virtuales, instancias de computación o componentes de nivel superior como registros DNS.


## Sintaxis
<pendiente>
## Tipos de recursos
<pendiente>
## Comportamiento de los recursos
<pendiente>
## Meta-argumentos
<pendiente>
## Recursos locales
<pendiente>
## Timeouts
<pendiente>

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

## Ficheros de configuración
Es posible configurar el comportamiento de la CLI, y se aplican en todos los directorios de trabajo de Terraform.

Podemos encontrar ficheros __.terraformrc__ o __.terraform.rc__.

Es posible indicar un fichero de configuración, añadiendo el path a la variable de entorno `TF_CLI_CONFIG_FILE`

El fichero de configuración utiliza el mismo lenguaje que los ficheros de Terraform (HLC), y las configuraciones disponibles son las siguientes:
- credentials
- credentials_helper
- diable_checkpoint
- disable_checkpoint_signature
- plugin_cache_dir
- provider_installation


## Variables de entorno
Terraform admite variables de entorno para cambiar su comportamiento, __pero ninguna de estas variables son necesarias para su funcionamiento__.
Las variables admitidas por Terraform son las siguientes:

### TF_LOG
Util para el debug de Terraform, los valores posibles son `TRACE`, `DEBUG`, `INFO`, `WARN` o `ERROR`. 
Para deshabilitarlo, basta con declarar la variable vacia.

### TF_LOG_PATH
Ruta del fichero donde dejará los logs, también debe estar definida la variable `TF_LOG`.

### TF_INPUT
Cuando una variable de terraform no está definida, en la terminal se obtiene un mensaje para indicarlo. 
Si la variable `TF_INPUT`, se establece com `false` o `0`, se deshabilita el comportamiento. 
Se puede establecer en linea de comandos indicando `-input=false`.

### TF_VAR_name
En lugar de indicar el valor en el código de Terraform, es posible indicar el valor, mediante variale de entorno. Previamente, la variable debe estar definida.
Por ejemplo:

```
export TF_VAR_region=us-west-1
export TF_VAR_ami=ami-049d8641
export TF_VAR_alist='[1,2,3]'
export TF_VAR_amap='{ foo = "bar", baz = "qux" }'

```

### TF_CLI_ARGS and TF_CLI_ARGS_name 
Permite especificar argumentos adicionales en la linea de comandos.
Se inserta directamente después del sub-comando y tienen prioridad sobre las variables de entorno.

Por ejemplo:
```
export TF_CLI_ARGS="-input=false"

Cuando se lance:
terraform apply -force

En realidad se está lanzando:
terraform apply -input=false -force
```

Es posible indicar que solamente afecte a un sub-comando. Por ejemplo:

```
export TF_CLI_ARGS_plan="-refresh=false"
```

### TF_DATA_DIR
Permite indicar la ubicación de los datos del directorio de trabajo.
Por defecto los datos se escriben en el directorio __.terraform__ del directorio actual.

> Puede ser util cuando el directorio de trabajo, no es editable.

### TF_IN_AUTOMATION
Modifica la salida cuando se utiliza en un entorno de CI.

### TF_REGISTRY_DISCOVERY_RETRY
Permite configurar el número máximo de reintentos de solicitud.

### TF_REGISTRY_CLIENT_TIMEOUT
Segundo establecidos para el timeout, por defecto `10s`.
```
export TF_REGISTRY_CLIENT_TIMEOUT=15
```

### TF_CLI_CONFIG_FILE
Localización del fichero `.terraformrc`.
```
export TF_CLI_CONFIG_FILE="$HOME/.terraformrc-custom"
```
### TF_IGNORE
Si el valor de la variable es `TRACE`, mostrará debug, sobre fichero y directorios ignorados.

Es posible crear ficheros `.terraformignore`, para determinar que tipo de ficheros serán ignorados en la ejecución.

## Comandos
Todos los sub-comandos que se pueden lanzar con terraform son los siguientes:

| command  | Usage  | description  |
|---|---|---|
| apply   | terraform apply [options] [dir-or-plan]  | Utilizado para aplicar los cambios para alcanzar el estado deseado  |
| console  | terraform console [options] [dir]  | Consola interactiva para evaluar expresiones  |
| destroy  | terraform destroy [options] [dir]  | Destruye la infraestructura  |
| fmt  | terraform fmt [options] [DIR]  | Reescribe los ficheros a un formato y estilo canónico  |
| force-unlock  | terraform force-unlock LOCK_ID [DIR]  | Desbloqueo manual de la configuración definida  |
| get  | terraform get [options] [dir]  | Descarga y actualiza los módulos mencionados en el módulo raiz  |
| graph  | terraform graph [options] [DIR]  | Genera una representación visual de un plan de configuración, en formato DOT y representable por GraphViz |
| import  | terraform import [options] ADDRESS_ID  | Importa recursos existentes  |
| init  | terraform init [options] [DIR]  | Inicializa el directorio de trabajo, por ejemplo, descargando los `providers` necesarios  |
| login  | terraform login [hostname]  | Obtener y guardar un token para la API de Terraform Cloud, Enterprise u otro host  |
| logout  | terraform logout [hostname]  | Elimina token para la API de Terraform Cloud, Enterprise u otro host   |
| output  | terraform output [options] [NAME]  | Muestra el valor de la salida de una variable definida en el `State file`  |
| plan  | terraform plan [options] [dir]  | Plan de ejecución. Permite conocer que modificaciones hará para alcanzar el estado deseado  |
| providers  | terraform providers [config-path]  | Muestra información sobre los `providers` usandos en la configuración actual  |
| refresh  | terraform refresh [options] [dir]  | Alinear `State file` con el estado actual  |
| show  | terraform show [options] [path]   | Muestra salida legible sobre un `State File` o `Plan File`  |
| state  | terraform state <subcommand> [options] [args]  | Permite modificar el `State File`, o incluso hacer backups de el  |
| taint  | terraform taint [options] address  | Permite marcar un recursos para forzar su recreación en el proximo `apply`  |
| validate  | terraform validate [options] [dir]  | Valida los archivos de configuración, sin acceder a ningún servicio remoto   |
| untaint  | terraform untaint [options] name  | Permitir desmarcar un recurso que ha sido marcado para su recreación  |
| workspace  | terraform workspace <subcommand> [options] [args]  | Usado para administrar los workspaces  |


# Providers
Un _Provider_, es el responsable de comprender las interacciones de la API y de exponer sus recursos. 

__Terraform Registry__ es el almacen principal de los __providers__ de Terraform disponibles públicamente.

Debe indicar en su código el __provider__ o __providers__ a utilizar. 
Cuando ejecuta `terraform init`, busca el provider declarado y descarga su plugin en el directorio __.terraform__ del directorio de trabajo.

Puede encontrar los _providers_ manejados por Terraform, en la página oficial.
https://www.terraform.io/docs/providers/index.html

## Recursos necesarios
El primer recurso a indicar en nuestro código será el _provider_. Por ejemplo, para AWS:

```
provider "aws" {
  region  = "us-east-1"
  access_key = "PUT-YOUR-ACCESS-KEY-HERE"
  secret_key = "PUT-YOUR-SECRET-KEY-HERE"
}
```

> Las credenciales pueden ser indicadas como variables de entorno, tal como se utilizarían para interactuar con la plataforma, o en el propio recurso.

## Recursos recomendados
Es conveniente, pero no obligatorio, indicar algunas configuraciones para evitar problemas en la provisión de la infraestructura.
La siguiente configuración, permite que la versión del provider sea la última versión `2.X.X`. Y requiere que la versión de terraform sea igual o superior a la versión `0.12`
```
provider "aws" {
  region  = "us-east-1"
  version = "~> 2.55.0"
}

terraform {
  required_version = ">= 0.12"
}
```

# Ejercicios
Se han planteando los siguientes ejercicios para adquirir los conocimientos necesarios para la certificación.

| Índice  | Enlace  | Descripción  |
|---|---|---|
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