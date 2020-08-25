# Tainting
En ocasiones necesitamos recrear un recurso, es posible que hayamos modificado el recurso a mano no queramos devolverlo a su estado anterior, etc

Para ello tenemos el comnando
```
 terraform taint
```

Permite "manchar" un recurso para su recreación en el próximo __terraform apply__

