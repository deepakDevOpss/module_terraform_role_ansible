resource "aws_vpc" "vpc" {
    cidr_block  = var.vpc_cidr
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
        Name = format("%s-vpc", var.environment)
        Environment = var.environment
        Owner = var.owner
        CreatedDate = timestamp()
    }

}