# 12 - Módulos
Existe un principo en el desarrollo del software, __No Te Repitas__ ó __DRY__ (Don’t Repeat Yourself), su principal objetivo es evitar la duplicación de código.

Utilizando _modules_ de Terraform, evitamos repetir código, permitiendo la reutilización.

Los módulos se parametrizan para permitir su uso en diversos casos. Veamos algún ejemplo:

En el directorio modules se encuentra la definición de un recurso EC2, y que es invocado así, desde el directorio _project_:

```
module "ec2module" {
    source = "../modules/ec2"
    instance_type = "t2.large"
}
```

