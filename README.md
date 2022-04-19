# module_terraform_role_ansible
  This repository contains two folder 
  	<ol>
	<li>Ansible Roles</li>
	    <ol>
	    <li>mongodb</li>
	    <li>nginx</li>
	    <li>nodejs</li>
	    <li>php</li>
            </ol>
         <li>Terraform Modules</li>
	     <ol>
             <li>ec2</li>
	     <li>key-pair</li>
	     <li>networking</li>
             <li>rds</li>
	     <li>s3</li>
	     <li>security groups</li>
	</ol>

This repository also contain Dockerfile and Makefile, so that we do not face any problem while using when we use this modules and roles.

If we have to pass the parameter while running the role we can easily pass it

```
command - ansible-playbook site.yaml --extra-vars "key=value"
```
