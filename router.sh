#!/bin/bash

# Go to Directory of script
cd "$( dirname "${BASH_SOURCE[0]}" )"

echo "Installing predependencies on master"
# Install predependencies Manually
sudo apt-get install -y ansible

echo "Installing predependencies on slave"
# Install predependencies Manually
ansible router --vault-password-file ./password.txt -m apt -a "name=facter state=present update_cache=true" -o $@

echo "running playbook"
ansible-playbook --vault-password-file ./password.txt router.yml $@
