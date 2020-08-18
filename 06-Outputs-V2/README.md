# 06 - Outputs v2
Puede que trabajemos con directorios de trabajo distintos, por organización por otro motivo.
Es posible que recursos, ubicados en distintos directorios de trabajo, y con ficheros terraform.tfstate distintos, tengan la necesidad de consumir datos de otros `tfstate`.

1. En el `dir1` crearemos el grupo, y expondremos el nombre del grupo por medio del output.
2. En el `dir2`, crearemos el usuario y la unión, y consultaremos el output de otro `.tfstate`.
3. Introducimos otro objecto, los `data sources`, permite obtener datos de fuentes externas, en nuestro caso, necesitamos obtener el nombre del grupo que se ha creado en el dir1
4. La sintaxis para obtener a los outputs de otro tfstate, `data.terraform_remote_state.etiqueta_recurso.outputs.nombre_del_output`