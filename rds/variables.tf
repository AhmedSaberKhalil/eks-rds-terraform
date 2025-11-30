variable "allocated_storage" {
  type = number
}
/*
variable "db_name" {
  type = string
}*/

variable "engine" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}
variable "cluster_security_group_id" {
  type = string
}


