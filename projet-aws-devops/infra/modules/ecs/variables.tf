variable "vpc_id" {
  type        = string
  description = "ID of the VPC where ECS and ALB will be deployed"
}

variable "cluster_name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}

variable "container_definitions" {
  type = list(object({
    name      = string
    image     = string
    port      = number
    env       = optional(list(object({ name=string, value=string })), [])
  }))
}
