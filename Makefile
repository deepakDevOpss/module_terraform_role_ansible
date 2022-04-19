modify_var_file:
	mv var.yaml Terraform_Code

build:
	docker build -t terraform_modules .

run:
	docker rm -f modules || true
	docker run -itd --name modules -v ~/.aws:/root/.aws terraform_modules

apply_terraform:
	docker exec -i modules sh -c "python3 terraform-wrraper.py"

destroy_infra:
    docker exec -i modules sh -c "terraform destroy --auto-approve"
