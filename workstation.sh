#!/bin/bash

# Go to Directory of script
cd "$( dirname "${BASH_SOURCE[0]}" )"

git pull

echo "Installing predependencies"
# Install predependencies Manually
sudo apt-get install -y ansible

if [ ! -f ./password.txt ]; then
echo "ERROR! Password file 'password.txt' does not exist"

echo "running playbook"
# Run playbook.
ansible-playbook workstation.yml --vault-password-file ./password.txt $@
