variable "string" {
  type    = string
  default = null
}
variable "number" {
  type    = number
  default = null
}
variable "bool" {
  type    = bool
  default = null
}
variable "list" {
  type    = list(string)
  default = null
}
variable "map" {
  type    = map(string)
  default = null
}
variable "object" {
  type    = object({ name = string, age = number })
  default = null
}
variable "tuple" {
  type    = tuple([string, number, bool])
  default = null
}
