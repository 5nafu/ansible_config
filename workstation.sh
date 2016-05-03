#!/bin/bash

# Go to Directory of script
cd "$( dirname "${BASH_SOURCE[0]}" )"

git pull

echo "Installing predependencies"
# Install predependencies Manually
sudo apt-get install -y ansible

echo "running playbook"
# Run playbook.
ansible-playbook workstation.yml --vault-password-file ./password.txt -K $@
