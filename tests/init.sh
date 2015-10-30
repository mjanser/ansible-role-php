#!/bin/bash

export PYTHONUNBUFFERED=1
export ANSIBLE_FORCE_COLOR=1

PHP_VERSION=$1

if ! which ansible >/dev/null; then
    echo "Add APT repositories"
    export DEBIAN_FRONTEND=noninteractive
    apt-get install -qq software-properties-common &> /dev/null || exit 1
    apt-add-repository ppa:ansible/ansible &> /dev/null || exit 1

    apt-get update -qq

    echo "Installing Ansible"
    apt-get install -qq python-mysqldb &> /dev/null || exit 1
    apt-get install -qq ansible &> /dev/null || exit 1

    echo "Installing inventory file"
    rm -f /etc/ansible/hosts || exit 1
    echo '127.0.0.1' | tee /etc/ansible/hosts > /dev/null || exit 1

    echo "Ansible installed"
fi

cd /vagrant/ansible-role-php/tests
ansible-playbook playbook.yml --connection=local --extra-vars="php_version=$PHP_VERSION"

php --version
