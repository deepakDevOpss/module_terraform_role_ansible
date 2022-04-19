modify_var_file:
	mv var.yaml Terraform_Code

build:
	docker build -t terraform_modules .

run:
	docker rm -f modules || true
	docker run -itd --name modules -v ~/.aws:/root/.aws terraform_modules

move_var_file:
	mv vars.yaml terraform_modules

apply_terraform:
	make move_var_file
	docker exec -i modules sh -c "python3 move_var_file/terraform-wrraper.py"
