#!/bin/bash

PHP_VERSION=$1

ansible-playbook playbook.yml --syntax-check || exit 1

ansible-playbook playbook.yml --connection=local --extra-vars="php_version=$PHP_VERSION" || exit 1

echo "specified version: $PHP_VERSION"
php --version
if [ -n "$PHP_VERSION" ]; then
    php --version | grep -qi $PHP_VERSION && echo 'version check succeeded' || { echo 'wrong version installed' && exit 1; }
fi

php -r "date_default_timezone_get() == 'UTC' ? print(1) : print(0);" | grep -q 1 && echo 'timezone is correct' || { echo 'timezone is wrong' && exit 1; }

ansible-playbook playbook.yml --connection=local --extra-vars="php_version=$PHP_VERSION" | tee /tmp/idempotence.log
sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g" /tmp/idempotence.log | grep -q "changed=0.*failed=0" \
    && echo "Idempotence test: pass" \
    || { echo "Idempotence test: fail" && exit 1; }
