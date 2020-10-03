# 08 - Data types
With regard to the variables, it is advisable to indicate the type of data expected. The data can be:

| Type | Description | Example |
|---|---|---|
| string | Allows you to define free text | value for my variable | 
| number | Allows you to define numbers | 232335 | 
| bool | Allows you to define booleans | true |
| list(type) | Allows you to define a list of values of type any string, number, or bool | ["1", "2", "3"] |
| set(type) | Allows you to define a collection of unique values that have no identifier or secondary order | |
| map(type) | Allows you to define a collection of values in which each one is identified by a string label | { "foo": "bar", "bar": "baz" } OR { foo = "bar", bar = "baz" } |
| object({Attr name = type}) | a collection of named attributes that each has its own type | { name = "John", age = 52 } |
| tuple([type]) | sequence of elements identified by consecutive integers starting from zero, where each element has its own type | ["a", 15, true] |

