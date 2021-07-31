setup: tf-init
	make -C ansible setup

make deploy:
	make -C ansible deploy

tf-init:
	make -C terraform init

tf-show:
	make -C terraform show

tf-plan:
	make -C terraform plan

tf-apply:
	make -C terraform apply

tf-destroy:
	make -C terraform destroy
