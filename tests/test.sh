#!/bin/bash

ansible-playbook playbook.yml --syntax-check

ansible-playbook playbook.yml --connection=local --extra-vars="php_version=$PHP_VERSION"

php --version

ansible-playbook playbook.yml --connection=local --extra-vars="php_version=$PHP_VERSION" | tee /tmp/idempotence.log
sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g" /tmp/idempotence.log | grep -q "changed=0.*failed=0" \
    && (echo "Idempotence test: pass" && exit 0) \
    || (echo "Idempotence test: fail" && exit 1)
