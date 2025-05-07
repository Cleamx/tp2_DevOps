variable "subnet_ids"        { type = list(string) }
variable "db_identifier"     { type = string }
variable "db_username"       { type = string }
variable "db_password" {
  type      = string
  sensitive = true
}
variable "db_instance_class" { type = string }
