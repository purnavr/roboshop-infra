git:
	git pull
dev: git
	terraform init -backend-config=env-dev/state.tfvars
	terraform apply -auto-approve -var-file=env-dev/main.tfvars
prod: git
	terraform init -backend-config=env-prod/state.tfvars
	terraform apply -auto-approve -var-file=env-prod/main.tfvars



