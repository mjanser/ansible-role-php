# Ansible Role: PHP

An Ansible role that installs PHP on Ubuntu. The following versions of PHP are supported:

- PHP 5.5
- PHP 5.6
- PHP 7.0
- HHVM

This role is supposed to be used for development boxes and therefore has only few variables.

## Requirements

None

## Role Variables

Available variables are listed below, along with default values:

    php_version: 5.6
    php_timezone: UTC

    php_fpm: true
    php_fpm_user: vagrant
    php_fpm_group: vagrant

    php_web_server: nginx

## Dependencies

None

## Example Playbook

    - hosts: all
      roles:
        - { role: mjanser.php-dev }

## License

MIT
