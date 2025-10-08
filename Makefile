.PHONY: install remove verify verify-ad

install:
	ansible-playbook -i inventory.ini install_git.yml

remove:
	ansible-playbook -i inventory.ini remove_git.yml

verify:
	ssh root@157.180.112.37 "git --version || true"

verify-ad:
	ansible all -i inventory.ini -m command -a "git --version" || true

.PHONY: ping

ping:
	ansible all -i inventory.ini -m ping


# === новые команды для setup.yml ===

.PHONY: run tags users packages update

run:
	ansible-playbook -i inventory.ini setup.yml

tags:
	ansible-playbook -i inventory.ini setup.yml --tags "$(t)"

users:
	ansible-playbook -i inventory.ini setup.yml --tags users

packages:
	ansible-playbook -i inventory.ini setup.yml --tags packages

update:
	ansible-playbook -i inventory.ini setup.yml --tags update
