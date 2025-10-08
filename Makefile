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
