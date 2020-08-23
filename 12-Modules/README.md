# 12 - Módulos
Existe un principo en el desarrollo del software, __No Te Repitas__ ó __DRY__ (Don’t Repeat Yourself), su principal objetivo es evitar la duplicación de código.

Con los módulos, evitamos repetir código, permitiendo la reutilización, y modificación por medio de varibles.

Una vez declarado del módulo de EC2, será posible su reutilización, si nn necesidad de volver a escribirlo.

```
module "ec2module" {
    source = "../modules/ec2"
}
```

Para que nuestro módulo sea parametrizable, es necesario definir las variables necesarias.
Nuestro módulo tiene variables por defecto por si no fueran definidas
```
```

# Terraform Registry
Los módulos oficiales de recuros de terraform, se encuentran en su Registry

