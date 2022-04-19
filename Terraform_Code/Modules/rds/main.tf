data "aws_availability_zones" "availables" {}

resource "aws_security_group" "sg" {
  name        = "db-wizard"
  description = "Allow Database inbound traffic"
  vpc_id      = var.vpc_id
  ingress {
    description = "MYSQL/Aurora"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "sg-for-db"
  }
}

resource "aws_subnet" "rds_subnet_" {

  count             = 3
  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 8, count.index + 30)
  availability_zone = data.aws_availability_zones.availables.names[count.index]

  tags = {
    Name = "rds_subnet_${count.index}"
  }

}

resource "aws_db_subnet_group" "rdssubnet" {
  name       = "database subnet"
  subnet_ids = aws_subnet.rds_subnet_.*.id
}

resource "aws_db_instance" "default" {
  identifier                 = var.rds_instance_identifier
  engine                     = "mysql"
  engine_version             = "5.7.37"
  db_name                    = var.rdsdbname
  username                   = var.rdsusername
  password                   = var.rdspasswd
  allocated_storage          = 20
  max_allocated_storage      = 25
  storage_type               = "gp2"
  db_subnet_group_name       = aws_db_subnet_group.rdssubnet.name
  instance_class             = "db.t2.micro"
  port                       = 3306
  publicly_accessible        = true
  skip_final_snapshot        = true
  auto_minor_version_upgrade = true
  vpc_security_group_ids     = [aws_security_group.sg.id]
  tags = {
    Name = "awsrds"
  }
  depends_on = [
    aws_security_group.sg,
  ]
}

resource "aws_db_parameter_group" "default" {
  name        = "${var.rds_instance_identifier}-param-group"
  description = "Terraform example parameter group for mysql5.6"
  family      = "mysql5.7"
  parameter {
    name  = "character_set_server"
    value = "utf8"
  }
  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
}
