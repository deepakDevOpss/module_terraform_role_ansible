module "infrastructure" {
    source = "./Modules/infrastructure"
    vpc_cidr = var.vpc_cidr
    public_subnets_cidr = var.public_subnets_cidr
    private_subnets_cidr = var.private_subnets_cidr
    key_name = var.key_name
    bucket_name = var.bucket_name
    instance_type = var.instance_type
    ami = var.ami
    Name = var.Name
    environment = var.environment
    owner = var.owner
    sg_name = var.sg_name
    rdsdbname = var.rdsdbname
    rdsusername = var.rdsusername
    rdspasswd = var.rdspasswd
    rds_instance_identifier = var.rds_instance_identifier
    storage_type = var.storage_type
    instance_class = var.instance_class
}