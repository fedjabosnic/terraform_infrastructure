init:
	@echo
	@echo "> Running terraform init"
	@echo
	@terraform init \
	  -backend-config="path=.terraform/${platform}/${environment}/${region}/${stack}.tfstate" \
	  -reconfigure \
	  -no-color \
	  stack-${stack} 

format:
	@echo
	@echo "> Running terraform format"
	@echo
	@terraform fmt \
	  -check \
	  stack-${stack}

validate:
	@echo
	@echo "> Running terraform validate"
	@echo
	@terraform \
	  validate \
	  stack-${stack}

plan: init
	@echo
	@echo "> Running terraform plan"
	@echo
	@terraform plan \
	  -var-file=environments/${platform}/${environment}/${region}/terraform.tfvars \
	  -out=.terraform/${platform}/${environment}/${region}/${stack}.plan \
	  -compact-warnings \
	  stack-${stack}

apply: init
	@echo
	@echo "> Running terraform apply"
	@echo
	@terraform apply \
	  -var-file=environments/${platform}/${environment}/${region}/terraform.tfvars \
	  -compact-warnings \
	  -auto-approve \
	  stack-${stack}

destroy: init
	@echo
	@echo "> Running terraform destroy"
	@echo
	@terraform destroy \
	  -var-file=environments/${platform}/${environment}/${region}/terraform.tfvars \
	  -compact-warnings \
	  -auto-approve \
	  stack-${stack}