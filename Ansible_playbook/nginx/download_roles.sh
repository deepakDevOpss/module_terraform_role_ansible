#!/bin/bash
if [[ ! -e geerlingguy.nginx ]]; then
    ansible-galaxy install -p ${PWD} geerlingguy.nginx
elif [[ ! -d geerlingguy.nginx ]]; then
    echo "geerlingguy.nginx already exist but is not a directory" 1>&2
fi

cat << 'EOF' > ${PWD}/install_site.yaml 
---
- hosts: localhost
  become: yes
  roles:
  - geerlingguy.nginx
EOF
