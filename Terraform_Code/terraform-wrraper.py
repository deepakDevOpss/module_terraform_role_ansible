#!/bin/python
from python_terraform import *
import yaml
import os

with open("vars.yaml", 'r') as stream:
    try:
        my_dict = yaml.safe_load(stream)
        environment = my_dict['environment']
        owner = my_dict['owner']
        vpc_cidr = my_dict['vpc_cidr']
        public_subnets_cidr = my_dict['public_subnets_cidr']
        private_subnets_cidr = my_dict['private_subnets_cidr']
        key_name = my_dict['key_name']
        bucket_name = my_dict['bucket_name']
        instance_type = my_dict['instance_type']
        ami = my_dict['ami']
        Name = my_dict['Name']
        rdsusername = my_dict['rdsusername']
        rdspasswd = my_dict['rdspasswd']
        rdsdbname = my_dict['rdsdbname']
        rds_instance_identifier = my_dict['rds_instance_identifier']
        storage_type = my_dict['storage_type']
        instance_class = my_dict['instance_class']

    except yaml.YAMLError as exc:
        print(exc)

cwd = os.getcwd()
tf = Terraform(working_dir=cwd, variables={'environment': environment,
                                           'owner': owner,
                                           'vpc_cidr': vpc_cidr,
                                           'public_subnets_cidr': public_subnets_cidr,
                                           'private_subnets_cidr': private_subnets_cidr,
                                           'key_name': key_name,
                                           'bucket_name': bucket_name,
                                           'instance_type': instance_type,
                                           'ami': ami,
                                           'Name': Name,
                                           'rdsusername': rdsusername,
                                           'rdspasswd': rdspasswd,
                                           'rdsdbname': rdsdbname,
                                           'rds_instance_identifier': rds_instance_identifier,
                                           'storage_type': storage_type,
                                           'instance_class': instance_class})

tf.init()
tf.plan(no_color=IsFlagged, refresh=False, capture_output=False,out="plan.out")
cmd = "terraform apply plan.out"
os.system(cmd)
