# Workspaces
Los workspaces ayudan a mantener el mismo código para entornos distintos.

Por ejemplo, dado dos entornos: Producción y preproducción.

Las instancias creadas para el entorno pre-productivo, pueden ser de inferior capacidad, sin embarto para las del entorno produccito, puede ser de mayor capacidad.

```
terraform workspace show
terraform workspace list
terraform workspace new dev
terraform workspace select dev
```