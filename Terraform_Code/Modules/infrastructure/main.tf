module "key-pair" {
  source   = "../key-pair/"
  key_name = var.key_name
}

module "networking" {
  source               = "../networking/"
  vpc_cidr             = var.vpc_cidr
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
  environment          = var.environment
  owner                = var.owner
}

module "s3" {
  source      = "../s3"
  bucket_name = var.bucket_name
}

module "security_group" {
  source  = "../security_group"
  vpc_id  = module.networking.vpc_id
  sg_name = var.sg_name
}

module "ec2" {
  source         = "../ec2"
  instance_type  = var.instance_type
  ami            = var.ami
  key_name       = var.key_name
  security_gp_id = module.security_group.ssh_sg_id
  subnet         = module.networking.public_subnet_id[0]
  Name           = var.Name
  environment    = var.environment
}

module "rds" {
  source                  = "../rds"
  vpc_id                  = module.networking.vpc_id
  vpc_cidr_block          = module.networking.vpc_cidr_block
  rdsdbname               = var.rdsdbname
  rdsusername             = var.rdsusername
  rdspasswd               = var.rdspasswd
  rds_instance_identifier = var.rds_instance_identifier
  storage_type            = var.storage_type
  instance_class          = var.instance_class
}


