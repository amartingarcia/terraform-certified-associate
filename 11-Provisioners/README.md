# Provisioners
Terraform crea infraestructura, pero para permitir aplicar configuraciones, existen los provisioners.

Existen varios:
- local-exec: se ejecuta ejecuta despues de crear el recuros en la máquina en la que se invoca Terraform.
- remote-exec: permite ejecutar acciones en el recurso remoto.
