include make-vault.mk

setup: prepare-vault-password install

prepare-vault-password:
	touch ../vault-password

set-vault-password:
	echo "$(PASSWORD)" > vault-password

install:
	ansible-galaxy role install -r requirements.yml
	ansible-galaxy collection install -r requirements.yml

update-deps:
	ansible-galaxy role install -r requirements.yml --force
	ansible-galaxy collection install -r requirements.yml --force

ping:
	ansible -i inventory.ini all -m ping

uptime:
	ansible -i inventory.ini all -a "uptime"

deploy:
	ansible-playbook playbook.yml -vv -i inventory.ini --vault-password-file ../vault-password
