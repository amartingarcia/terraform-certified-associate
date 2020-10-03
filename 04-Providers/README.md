# 04 - Providers
When using a _provider_, if we do not specify a version, it will download the latest available version.

1. File with the configuration.
```
provider "aws" {
  region     = "us-west-1"
}

```

2. Download the provider.
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

It may be interesting to define the version the provider you want to work with, or a range of versions.

| Version | Description |
|---|---|
| >=1.0 | Version equal or greater |
| <1.0 | Minor version |
|>2.0 | Any version of the 2.
| >=2.10,<=2.30 | Any version between 2.10 and 2.30

> It is possible that our version of terraform is incompatible with the provider's version, if this is an older version.

