#!/bin/bash

# Go to Directory of script
cd "$( dirname "${BASH_SOURCE[0]}" )"

git pull

ansible-playbook site.yml --ask-vault-pass $@
