create-vault:
	ansible-vault create $(F) --vault-password-file ../vault-password

encrypt-vault:
	ansible-vault encrypt $(F) --vault-password-file ../vault-password

decrypt-vault:
	ansible-vault decrypt $(F) --vault-password-file ../vault-password

edit-vault:
	ansible-vault edit $(F) --vault-password-file ../vault-password

view-vault:
	ansible-vault view $(F) --vault-password-file ../vault-password
