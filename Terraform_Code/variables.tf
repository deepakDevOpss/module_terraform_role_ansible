variable "environment" {
  default     = "test"
  description = "environment name in which you want to deploy"
}

variable "owner" {
  default = "deepak"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "CIDR for vpc"
}

variable "public_subnets_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  description = "list od CIDR for public subnets"
}

variable "private_subnets_cidr" {
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
  description = "list of CIDR for public subnets"
}

variable "sg_name" {
  type    = string
  default = "ssh_group"
}

variable "key_name" {
  type    = string
  default = "deepak_test"
}

variable "bucket_name" {
  default     = "deepakhestabittoday"
  description = "bucket name"
}

variable "instance_type" {
  default     = "t2.micro"
  description = "instance type"
}

variable "ami" {
  default     = "ami-0d73480446600f555"
  description = "ami id"
}

variable "Name" {
  default     = "deepak"
  description = "description"
}

variable "rdsusername" {
  type        = string
  default     = "admin"
  description = "Username for database"
}

variable "rdspasswd" {
  type        = string
  default     = "admin12345"
  description = "Password for AWS-RDS MySQL Database"
}

variable "rdsdbname" {
  type        = string
  default     = "mysqldb"
  description = "Name of AWS-RDS MySQL Database"
}

variable "rds_instance_identifier" {
  type    = string
  default = "database"
}

variable "storage_type" {
  type    = string
  default = "gp2"
}

variable "instance_class" {
  type    = string
  default = "db.t2.micro"
}
