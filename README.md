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



# Introducción
Terraform es una herramienta para construir, cambiar y versionar la infraestructura de forma segura y eficiente, escrita en Go. Terraform puede gestionar los proveedores de servicios existentes y populares, así como soluciones internas personalizadas.

Los archivos de configuración describen a Terraform los componentes necesarios para ejecutar una sola aplicación o todo su centro de datos. Terraform genera un plan de ejecución que describe lo que hará para alcanzar el estado deseado, y luego lo ejecuta para construir la infraestructura descrita. A medida que la configuración cambia, Terraform es capaz de determinar lo que ha cambiado y crear planes de ejecución incrementales que pueden ser aplicados.

La infraestructura que Terraform puede gestionar incluye componentes de bajo nivel como instancias de cálculo, almacenamiento y redes, así como componentes de alto nivel como entradas DNS, características SaaS, etc.

Las caracteristicas principales son:
- Infra as code: permite mantener la infraestructura como código, permite la definición en HLC(HashiCorp Configuration Language) o JSON
- Executions Plans: permite mostrar que cambios va a subrir la infraestructura antes de aplicarlos.
- Resource Graph: Permite la construcción de gráficos de infraestructura.


# Casos de uso
Los casos de uso más comunes son los siguientes:
- Heroku App Setup: Puede ser utilizado para codificar la configuración asegurandose que los add-ons estén disponbiles, configurar DNSSimple, o configurar Cloudflare sin usar interfaz web.
- Multi-Tier Apps: Con terraform pueden describirser colecciones de recursos, y las dependencias entre niveles se manejarán automáticamente.
- Self-Service Clusters: Con un cierto tamaño organizativo, se hace compleja la operación para una infraestructura grande y creciente. 
- Software Demos:
- Disposable Environments: Es posible crear y destruir entornos efímeros rápidamente, replicando un entorno productivo
- Software Defined Networking:
- Resource Schedulers:
- Multi-Cloud Deployment: Permite mantener código para varias nubes, creando incluso dependencias entre recursos.


# Lenguaje de configuración
Terraform utiliza su propio lenguaje, es declarativo, describiendo una meta en lugar de los pasos para alcanzarla.

## Recursos y módulos
El proposito principal es declara los recursos, las demás características existen solo para hcer la definición del recurso más flexible y conveniente.

Un grupo de recursos puede ser un módulo. Un recurso describe un solo objeto de infraestructura, mientras que un módulo puede describir un conjunto de objetos.

## Argumentos, bloques y expresiones
La sintaxis del lenguaje, consigue en unos pocos elementos:

```
resource "aws_vpc" "main" {
  cidr_block = var.base_cidr_block
}

<BLOCK TYPE> "<BLOCK LABEL>" "<BLOCK LABEL>" {
  # Block body
  <IDENTIFIER> = <EXPRESSION> # Argument
}
```
- Bloques: Son contenedores de otros contendos, y suelen representar la configuración del algún tipo de objeto. Pueden tener cero o más etiquetas
- Argumentos: Asigna un valor a un nombre. Aparecen dentro de los bloques
- Expresiones: Representan un valor, ya sea literalmente o mediante la referencia o combinación de otros valores.

## Organización de código
Los ficheros de Terraform se nombra con la extensión __.tf__. También es posible utilizar JSON, utilizando extensión __.tf.json__
Debe usar la codificación UTF-8, y por convención suelen mantenerse con terminanciones de lina estilo Unix (LF).

Un moódulo es una colección de archivos __.tf__ o __tf.json__ mantenidos juntos en un directorio.

## Configuración de ordenación
Debido a que el lenguaje de configuración es declarativo, el orden de los blqoues no es significativo (el orden de los bloques de __provisioners__ es la única característica importante donde el orden importa).

Terraform procesa los recuros en el orden correcto, basado en las relaciones definidas entre ellos en la configuración. 

## Terraform CLI vs otros providers
Terraform CLI, es un motor para evaluar y aplicar las configuraciones de Terraform.

Este motor general no tiene conocimiento sobre tipos de objetos específicos. En su lugar, Terraform utiliza plugins llamados __providers__ que definen y adminstran cada conjunto de tipo de recursos.


# Bloque de configuración
Los recursos son el elemento más importante en el lenguaje de la Terraforma. Cada bloque de recursos describe uno o más objetos de infraestructura, como redes virtuales, instancias de computación o componentes de nivel superior como registros DNS.


## Sintaxis
## Tipos de recursos
## Comportamiento de los recursos
## Meta-argumentos
## Recursos locales
## Timeouts

# Terraform CLI
Terraform se controla a través de linea de comandos. Se puede ejecutar multitud de sub-comandos. Puedes conocer todos los subcomandos disponibles ejecutando:
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
Terraform admite variables de entorno para cambiar su comportamiento, pero ninguna de estas variables son necesarias para su funcionamiento.
Las posible variables son las sigientes:

### TF_LOG
Util para la debug de Terraform, los valores posibles son `TRACE`, `DEBUG`, `INFO`, `WARN` o `ERROR`. 
Para desabilitarlo, basta con declarar la variable vacia.

### TF_LOG_PATH
Ruta del fichero donde dejará los logs, también debe estar definida la variable `TF_LOG`.

### TF_INPUT
Cuando una variable de terraform no está definida, en la terminal se obtiene un mensaje para definirla. 
Si la variable `TF_INPUT`, se establece com `false` o `0`, se deshabilita el comportamiento. Se puede establecer en linea de comandos indicando `-input=false`.

### TF_VAR_name
Se pueden establecer valores de variables de códido de terraform, como variables de entorno. Previamente, la variable debe estar definida.
Por ejemplo:

```
export TF_VAR_region=us-west-1
export TF_VAR_ami=ami-049d8641
export TF_VAR_alist='[1,2,3]'
export TF_VAR_amap='{ foo = "bar", baz = "qux" }'

```

### TF_CLI_ARGS and TF_CLI_ARGS_name 
Permite especificar argumentos adicionales a la linea de comandos.
Se inserta directamente despues del subcomando. Este comportamiento, asegura que las flas den la linea de comandos, tienen prioridad sobre las variables de entorno.
Por ejemplo:
```
export TF_CLI_ARGS="-input=false"

Cuando se lance:
terraform apply -force

En realidad se está lanzando:
terraform apply -input=false -force
```

Es posible indicar que solamente afecte a un subcomando. Por ejemplo:
```
export TF_CLI_ARGS_plan="-refresh=false"
```

### TF_DATA_DIR
Permite indicar la ubicación de los datos del directorio de trabajo.
Por defecto los datos se escriben en el directorio __.terraform__ del directorio actual.

Puede ser util cuando el directorio de trabajo, no es editable.

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
Si el valor de la variable es `trace`, mostrará debug, sobre fichero y directorios ignorados.

Es posible crear ficheros `.terraformignore`, para determinar que tipo de ficheros serán ignorados en la ejecución

## Comandos
Todos los sub-comandos que se pueden lanzar con terraform son los siguientes:

| command  | flags  | description  |
|---|---|---|
| apply   |   |   |
| console  |   |   |
| destroy  |   |   |
| env  |   |   |
| fmt  |   |   |
| force-unlock  |   |   |
| get  |   |   |
| graph  |   |   |
| import  |   |   |
| init  |   |   |
| login  |   |   |
| logout  |   |   |
| output  |   |   |
| plan  |   |   |
| providers  |   |   |
| push  |   |   |
| refresh  |   |   |
| show  |   |   |
| state  |   |   |
| taint  |   |   |
| validate  |   |   |
| untaint  |   |   |
| workspace  |   |   |