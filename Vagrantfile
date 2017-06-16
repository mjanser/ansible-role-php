Vagrant.configure('2') do |config|
  config.vm.box = 'mjanser/fedora25-64-lxc'

  config.vm.define 'php-dist-fedora-25' do | vmconfig |
    vmconfig.vm.hostname = 'php-dist-fedora-25'
    vmconfig.vm.box = 'mjanser/fedora25-64-lxc'
  end

  config.vm.define 'php-5-6-fedora-25' do | vmconfig |
    vmconfig.vm.hostname = 'php-5-6-fedora-25'
    vmconfig.vm.box = 'mjanser/fedora25-64-lxc'
  end

  config.vm.define 'php-7-0-fedora-25' do | vmconfig |
    vmconfig.vm.hostname = 'php-7-0-fedora-25'
    vmconfig.vm.box = 'mjanser/fedora25-64-lxc'
  end

  config.vm.define 'php-7-1-fedora-25' do | vmconfig |
    vmconfig.vm.hostname = 'php-7-1-fedora-25'
    vmconfig.vm.box = 'mjanser/fedora25-64-lxc'
  end

  config.vm.define 'php-dist-debian-jessie' do | vmconfig |
    vmconfig.vm.hostname = 'php-dist-debian-jessie'
    vmconfig.vm.box = 'debian/jessie64'
  end

  config.vm.define 'php-5-6-debian-jessie' do | vmconfig |
    vmconfig.vm.hostname = 'php-5-6-debian-jessie'
    vmconfig.vm.box = 'debian/jessie64'
  end

  config.vm.define 'php-7-0-debian-jessie' do | vmconfig |
    vmconfig.vm.hostname = 'php-7-0-debian-jessie'
    vmconfig.vm.box = 'debian/jessie64'
  end

  config.vm.define 'php-7-1-debian-jessie' do | vmconfig |
    vmconfig.vm.hostname = 'php-7-1-debian-jessie'
    vmconfig.vm.box = 'debian/jessie64'
  end

  config.vm.define 'php-dist-ubuntu-xenial' do | vmconfig |
    vmconfig.vm.hostname = 'php-dist-ubuntu-xenial'
    vmconfig.vm.box = 'nhinds/xenial64'
  end

  config.vm.define 'php-5-6-ubuntu-xenial' do | vmconfig |
    vmconfig.vm.hostname = 'php-5-6-ubuntu-xenial'
    vmconfig.vm.box = 'nhinds/xenial64'
  end

  config.vm.define 'php-7-0-ubuntu-xenial' do | vmconfig |
    vmconfig.vm.hostname = 'php-7-0-ubuntu-xenial'
    vmconfig.vm.box = 'nhinds/xenial64'
  end

  config.vm.define 'php-7-1-ubuntu-xenial' do | vmconfig |
    vmconfig.vm.hostname = 'php-7-1-ubuntu-xenial'
    vmconfig.vm.box = 'nhinds/xenial64'
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.groups = {
        'dist' => [
            'php-dist-fedora-25',
            'php-dist-debian-jessie',
            'php-dist-ubuntu-xenial',
        ],
        'dist:vars' => {'php_version' => 'distribution'},
        '5.6' => [
            'php-5-6-fedora-25',
            'php-5-6-debian-jessie',
            'php-5-6-ubuntu-xenial',
        ],
        '5.6:vars' => {'php_version' => '5.6'},
        '7.0' => [
            'php-7-0-fedora-25',
            'php-7-0-debian-jessie',
            'php-7-0-ubuntu-xenial',
        ],
        '7.0:vars' => {'php_version' => '7.0'},
        '7.1' => [
            'php-7-1-fedora-25',
            'php-7-1-debian-jessie',
            'php-7-1-ubuntu-xenial',
        ],
        '7.1:vars' => {'php_version' => '7.1'}
    }
    ansible.sudo = true
    ansible.install_mode = "pip"
  end

  config.vm.provision 'shell' do |s|
    s.keep_color = true
    s.inline = <<SCRIPT
PATH=/usr/local/bin:$PATH
PHP_VERSION=$(hostname | cut -d- -f2,3 | sed "s/-/./")
test $(hostname | cut -d- -f2) == "dist" && PHP_VERSION=

echo "specified version: $PHP_VERSION"
php --version
if [ -n "$PHP_VERSION" ]; then
    php --version | grep -qi $PHP_VERSION && echo 'version check succeeded' || { echo 'wrong version installed' && exit 1; }
fi

php -r "date_default_timezone_get() == 'UTC' ? print(1) : print(0);" | grep -q 1 && echo 'timezone is correct' || { echo 'timezone is wrong' && exit 1; }

cd /vagrant/
ansible-playbook playbook.yml --limit $(hostname) --inventory-file /tmp/vagrant-ansible/inventory/vagrant_ansible_local_inventory 2>&1 | tee /tmp/ansible.log

# Remove colors from log file
sed -i -r "s/\\x1B\\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g" /tmp/ansible.log

# Test for errors
test -n "$(grep -L 'ERROR' /tmp/ansible.log)" \
    && { echo "Errors test: pass"; } \
    || { echo "Errors test: fail" && exit 1; }

# Test for warnings
test -n "$(grep -L 'WARNING' /tmp/ansible.log)" \
    && { echo "Warnings test: pass"; } \
    || { echo "Warnings test: fail" && exit 1; }

# Test for idempotence
grep -q "changed=0.*failed=0" /tmp/ansible.log \
    && { echo "Idempotence test: pass"; } \
    || { echo "Idempotence test: fail" && exit 1; }

ansible-playbook playbook.yml --limit $(hostname) --inventory-file /tmp/vagrant-ansible/inventory/vagrant_ansible_local_inventory --check 2>&1 | grep -q "changed=0.*failed=0" \
    && { echo "Check mode: pass"; } \
    || { echo "Check mode: fail" && exit 1; }

SCRIPT
  end
end
