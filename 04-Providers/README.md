# 04 - Providers
Cuando utilizamos un _provider_, si no especificamos una versión, descargará la última versión disponible.

1. Fichero con la configuración.
```
provider "aws" {
  region     = "us-west-1"
}

```

2. Descargamos el provider.
```
terraform init

Initializing the backend...

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "aws" (hashicorp/aws) 3.2.0...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.aws: version = "~> 3.2"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

Puede ser interesante definir la versión el provider con la que queremos trabajar, o un rango de versiones.

| Version | Description |
|---|---|
| >=1.0  | Versión igual o mayor  |
| <1.0  | Versión menor  |
| ~>2.0  | Cualquier versión del rango 2.X  |
| >=2.10,<=2.30  | Cualquier versión entre 2.10 y 2.30  |

> Es posible que nuestra versión de terraform sea incompatible con la versión del provider, si esta es una versión antigua.

