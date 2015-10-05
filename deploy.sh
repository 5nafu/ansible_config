#!/bin/bash

# Go to Directory of script
cd "$( dirname "${BASH_SOURCE[0]}" )"

git pull

# Install predependencies Manually
ansible all  --vault-password-file ./password.txt  -a "apt-get install python facter"

# Run playbook.
ansible-playbook site.yml --vault-password-file ./password.txt $@
