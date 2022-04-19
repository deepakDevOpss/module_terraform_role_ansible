output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value = join("", aws_vpc.vpc.*.cidr_block)
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.*.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.*.id
}

output "default" {
  value = [aws_security_group.default.id]
}