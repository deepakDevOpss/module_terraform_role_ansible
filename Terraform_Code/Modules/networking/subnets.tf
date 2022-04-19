data "aws_availability_zones" "availables" {}

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = format("%s-igw", var.environment)
    Environment = var.environment
    Owner = var.owner
    CreatedDate = timestamp()
  }
}

resource "aws_eip" "nat_eip" {
  vpc = true
  depends_on = [aws_internet_gateway.ig]
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = element(aws_subnet.public_subnet.*.id, 0)
  depends_on = [aws_internet_gateway.ig]
  tags = {
    Name = format("%s-nat", var.environment)
    Environment = var.environment
    Owner = var.owner
    CreatedDate = timestamp()
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc.id
  count = length(var.public_subnets_cidr)
  cidr_block = element(var.public_subnets_cidr, count.index)
  availability_zone = data.aws_availability_zones.availables.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = format("%s-public-subnet", var.environment)
    Environment = var.environment
    Owner = var.owner
    CreatedDate = timestamp()
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc.id
  count = length(var.private_subnets_cidr)
  cidr_block = element(var.private_subnets_cidr, count.index)
  availability_zone = data.aws_availability_zones.availables.names[count.index]
  map_public_ip_on_launch = false
  tags = {
    Name = format("%s-private-subnet", var.environment)
    Environment = var.environment
    Owner = var.owner
    CreatedDate = timestamp()
  }
}

