# module_terraform_role_ansible
  This repository contains two folder 
	1 - Ansible Roles
	    - mongodb
			- nginx
			- nodejs
			- php
	2 - Terraform Modules
			- ec2
			- key-pair
			- networking
			- rds
			- s3
			- security groups

This repository also contain Dockerfile and Makefile, so that we do not face any problem while using when we use this modules and roles.

If we have to pass the parameter while running the role we can easily pass it

command - ansible-playbook site.yaml --extra-vars "name=value"
