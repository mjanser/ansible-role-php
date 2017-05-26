# Ansible Role: PHP

An Ansible role that installs PHP on Ubuntu or Fedora. The following versions of PHP are supported:

- PHP 5.6
- PHP 7.0
- PHP 7.1

For PHP versions other than the distribution's one on Fedora [Remi's RPM repository](https://rpms.remirepo.net/) is used.
For the same on Ubuntu the PPA [deb.sury.org](https://deb.sury.org/) will be installed.

If nginx is installed on the system an upstream with the name `php-fpm` will be configured.

## Requirements

None

## Role Variables

Available variables are listed below, along with default values:

    php_version: ~

    php_timezone: UTC
    php_debug: false
    php_opcache_validate: false
    php_redis: false
    php_composer: true

    php_fpm: true
    php_fpm_socket: ~
    php_fpm_user: ~
    php_fpm_group: ~
    php_fpm_acl_users: ~

    php_fpm_pm: ~ # static, dynamic, ondemand
    php_fpm_pm_max_children: ~
    php_fpm_pm_start_servers: ~
    php_fpm_pm_min_spare_servers: ~
    php_fpm_pm_max_spare_servers: ~
    php_fpm_pm_process_idle_timeout: ~

### Version

The variable `php_version` defines the desired version of PHP to install. See above for supported versions.
If this variable is not set or is set to an unsupported version, the default PHP version of the Linux distribution
will be installed.

### Timezone

This role supports setting the default timezone of PHP with the variable `php_timezone`.

### Debug

If the variable `php_debug` is set to `true`, error reporting will be enabled.

### OPCache

By default the PHP OPCache does not validate the cache, which is good in production environment.
The validation can be enabled with setting the variable `php_opcache_validate` to `true`.

### Redis

The variable `php_redis` can be set to `true` to install the PHP extension for redis.

### Composer

By default [composer](https://getcomposer.org/) will be installed.
This can be prevented with setting the variable `php_composer` to `false`.

### PHP-FPM

PHP-FPM can be configured with the variables prefixed by `php_fpm`.
The installation of PHP-FPM can also be disabled when setting the variable `php_fpm` to `false`.

To give additional users access to the PHP-FPM socket, you can set the variable `php_fpm_acl_users`.

### PHP-FPM process management

With the variables prefixed by `php_fpm_pm` the process manager of PHP-FPM can be configured.
See the [documentation](http://php.net/manual/en/install.fpm.configuration.php) for more information.

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
        php_fpm_acl_users: apache,nginx,vagrant

## License

MIT
