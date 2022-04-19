variable "environment" {
  type = string
}

variable "key_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnets_cidr" {
  type = list(string)
}

variable "private_subnets_cidr" {
  type = list(string)
}

variable "owner" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "ami" {
  type = string
}

variable "Name" {
  type = string
}

variable "sg_name" {
  type = string
}

variable "rdsusername" {
  type = string
}

variable "rdspasswd" {
  type = string
}

variable "rdsdbname" {
  type = string
}

variable "rds_instance_identifier" {
  type = string
}

variable "storage_type" {
  type = string
}

variable "instance_class" {
  type = string
}











