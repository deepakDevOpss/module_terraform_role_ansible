variable "environment" {
  type = string
}

variable "owner" {
  type = string
}

variable "vpc_cidr" {
  description = "CIDR for vpc"
}

variable "public_subnets_cidr" {
  type        = list(string)
  description = "list od CIDR for public subnets"
}

variable "private_subnets_cidr" {
  type        = list(string)
  description = "list of CIDR for public subnets"
}