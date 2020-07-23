init:
	@echo
	@echo "> Running terraform init"
	@echo
	@terraform init -backend-config="path=.terraform/${platform}/${environment}/${region}/${stack}.tfstate" -reconfigure stack-${stack} 

plan: init
	@echo
	@echo "> Running terraform plan"
	@echo
	@terraform plan -var-file=environments/${platform}/${environment}/${region}/terraform.tfvars -compact-warnings stack-${stack}

apply: init
	@echo
	@echo "> Running terraform apply"
	@echo
	@terraform apply -var-file=environments/${platform}/${environment}/${region}/terraform.tfvars -compact-warnings stack-${stack}

destroy: init
	@echo
	@echo "> Running terraform destroy"
	@echo
	@terraform destroy -var-file=environments/${platform}/${environment}/${region}/terraform.tfvars -compact-warnings stack-${stack} 