# Provisioners
Terraform creates infrastructure, but to enable configurations to be applied, provisioners exist.

There are several:
- local-exec: runs after creating the resource on the machine on which Terraform is invoked.
- remote-exec: allows you to execute actions on the remote resource.
