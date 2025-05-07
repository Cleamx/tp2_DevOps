variable "region" {
  type    = string
  default = "eu-west-3"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_azs" {
  type    = list(string)
  default = ["eu-west-3a","eu-west-3b"]
}

variable "private_azs" {
  type    = list(string)
  default = ["eu-west-3a","eu-west-3b"]
}

variable "db_identifier" {
  type    = string
  default = "app-db"
}

variable "db_username" {
  type    = string
}

variable "db_password" {
  type    = string
  sensitive = true
}

variable "db_instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "ecr_backend" {
  type    = string
}

variable "ecr_frontend" {
  type    = string
}
