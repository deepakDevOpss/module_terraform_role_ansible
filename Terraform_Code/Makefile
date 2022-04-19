virtual-environment:
	sudo apt install python3-venv -y
	python3 -m venv my-project-env
	. ./my-project-env/bin/activate
	sudo apt-get install python3-pip -y
	pip3 install -r requirements.txt
	make apply

plan:
	terraform plan -out terraform.tfplan

apply:
	python3 terraform-wrraper.py

auto-approve:
	terraform apply --auto-approve

destroy:
	terraform destroy --auto-approve