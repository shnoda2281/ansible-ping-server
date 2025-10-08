.PHONY: ping

ping:
	ansible all -i inventory.ini -m ping
