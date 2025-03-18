# terraform init
# terraform plan
# terraform apply

.PHONY: init plan apply all help

help:
	@echo "利用可能なコマンド:"
	@echo "  make init   - terraform init を実行"
	@echo "  make plan   - terraform plan を実行"
	@echo "  make apply  - terraform apply を実行"
	@echo "  make all    - init, plan, apply を順番に実行"

init:
	terraform init

plan:
	terraform plan

apply:
	terraform apply

all: init plan apply