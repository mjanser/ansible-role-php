# Ansible Role: PHP

An Ansible role that installs PHP on Ubuntu or Fedora. The following versions of PHP are supported:

- PHP 5.5
- PHP 5.6
- PHP 7.0
- HHVM

If nginx is installed on the system an upstream with the name `php-fpm` will be configured.

## Requirements

None

## Role Variables

Available variables are listed below, along with default values:

    php_version: ~

    php_timezone: UTC
    php_debug: false
    php_redis: false

    php_fpm: true
    php_fpm_socket: ~
    php_fpm_user: ~
    php_fpm_group: ~

    php_fpm_pm: ~ # static, dynamic, ondemand
    php_fpm_pm_max_children: ~
    php_fpm_pm_start_servers: ~
    php_fpm_pm_min_spare_servers: ~
    php_fpm_pm_max_spare_servers: ~
    php_fpm_pm_process_idle_timeout: ~

    php_hhvm_port: 9000

## Dependencies

None

## Example Playbook

    - hosts: all
      roles:
        - { role: mjanser.php }

To set up a development box with Vagrant you can use the following playbook.

    - hosts: all
      roles:
        - { role: mjanser.php }
      vars:
        php_debug: true
        php_fpm_user: vagrant
        php_fpm_group: vagrant

### PHP versions

This Ansible role supports the installation of different PHP versions. By default the PHP version of the distribution is installed.

Installation of a specific version:

    php_version: 7.0

Installation of HHVM:

    php_version: hhvm

## License

MIT
