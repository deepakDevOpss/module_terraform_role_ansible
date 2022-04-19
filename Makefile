modify_var_file:
	mv var.yaml Terraform_Code

build:
	docker build -t terraform_modules .

run:
	docker rm -f modules || true
	docker run -itd --name modules -v ~/.aws:/root/.aws terraform_modules

apply_terraform:
	docker exec -i modules bash -c "python3 terraform-wrraper.py"
