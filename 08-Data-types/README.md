# 08 - Data types
Con respecto a las variables, es recomendable indicar el tipo de dato que se espera. Los datos pueden ser:

| Type  | Description | Ejemplo |
|---|---|---|
| string  | Permite definir texto libre | Valor para mi variable | 
| number  | Permite definir númeraciones  | 232335 | 
| bool  | Permite definir booleanos  | true |
| list(type)  | Permite definir una lista de valores de tipo any string, number, o bool  | ["1", "2", "3"] |
| set(type)  | Permite definir una colección de valores únicos que no tienen ningún identificador u orden secundario  |  |
| map(type)  | Permite definir una colección de valores en la que cada uno se identifica con una etiqueta de cadena  | { "foo": "bar", "bar": "baz" } OR { foo = "bar", bar = "baz" } |
| object({Attr name = type})  | una colección de atributos nombrados que cada uno tiene su propio tipo  | { name = "John", age  = 52 } |
| tuple([type]) | secuencia de elementos identificados por números enteros consecutivos empezando por cero, donde cada elemento tiene su propio tipo | ["a", 15, true] |



# String
