# Workspaces
Workspaces help maintain the same code for different environments.

For example, given two environments: production and pre-production.

The instances created for the pre-production environment can be of lower capacity, but for those in the production environment, it can be of higher capacity.

```
terraform workspace show
terraform workspace list
terraform workspace new dev
terraform workspace select dev
```