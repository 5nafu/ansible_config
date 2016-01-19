#!/bin/bash

# Go to Directory of script
cd "$( dirname "${BASH_SOURCE[0]}" )"

git pull

echo "Installing predependencies"
# Install predependencies Manually
ansible all  --vault-password-file ./password.txt  -a "apt-get install -y python facter"

echo "running playbook"
# Run playbook.
ansible-playbook site.yml --vault-password-file ./password.txt $@
