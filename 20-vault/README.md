# Vault

The vault tool must be installed
Start the service:
```
vault server -dev
```

In the configuration we indicate the IP address of the server, and run terraform init, to download the provider.
```
terraform init

Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/vault...
- Finding hashicorp/aws versions matching "~> 3.0"...
- Installing hashicorp/vault v2.13.0...
- Installed hashicorp/vault v2.13.0 (signed by HashiCorp)
- Installing hashicorp/aws v3.4.0...
- Installed hashicorp/aws v3.4.0 (signed by HashiCorp)

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, we recommend adding version constraints in a required_providers block
in your configuration, with the constraint strings suggested below.

* hashicorp/vault: version = "~> 2.13.0"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

