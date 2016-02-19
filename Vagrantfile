Vagrant.configure('2') do |config|
  config.vm.box = 'obnox/fedora23-64-lxc'

  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.synced_folder '.', '/vagrant/ansible-role-php'

  config.vm.define 'fedora-23-dist' do | vmconfig |
    vmconfig.vm.hostname = 'ansible-role-php-fedora-23-dist'
    vmconfig.vm.box = 'obnox/fedora23-64-lxc'

    vmconfig.vm.provision 'shell' do |s|
      s.keep_color = true
      s.path = 'tests/init.sh'
    end
  end

  config.vm.define 'fedora-23-php-5-6' do | vmconfig |
    vmconfig.vm.hostname = 'ansible-role-php-fedora-23-5-6'
    vmconfig.vm.box = 'obnox/fedora23-64-lxc'

    vmconfig.vm.provision 'shell' do |s|
      s.keep_color = true
      s.path = 'tests/init.sh'
      s.args = [ '5.6' ]
    end
  end

  config.vm.define 'fedora-23-php-7-0' do | vmconfig |
    vmconfig.vm.hostname = 'ansible-role-php-fedora-23-7-0'
    vmconfig.vm.box = 'obnox/fedora23-64-lxc'

    vmconfig.vm.provision 'shell' do |s|
      s.keep_color = true
      s.path = 'tests/init.sh'
      s.args = [ '7.0' ]
    end
  end

  config.vm.define 'ubuntu-trusty-dist' do | vmconfig |
    vmconfig.vm.hostname = 'ansible-role-php-ubuntu-trusty-dist'
    vmconfig.vm.box = 'fgrehm/trusty64-lxc'

    vmconfig.vm.provision 'shell' do |s|
      s.keep_color = true
      s.path = 'tests/init.sh'
    end
  end

  config.vm.define 'ubuntu-trusty-php-5-5' do | vmconfig |
    vmconfig.vm.hostname = 'ansible-role-php-ubuntu-trusty-5-5'
    vmconfig.vm.box = 'fgrehm/trusty64-lxc'

    vmconfig.vm.provision 'shell' do |s|
      s.keep_color = true
      s.path = 'tests/init.sh'
      s.args = [ '5.5' ]
    end
  end

  config.vm.define 'ubuntu-trusty-php-5-6' do | vmconfig |
    vmconfig.vm.hostname = 'ansible-role-php-ubuntu-trusty-5-6'
    vmconfig.vm.box = 'fgrehm/trusty64-lxc'

    vmconfig.vm.provision 'shell' do |s|
      s.keep_color = true
      s.path = 'tests/init.sh'
      s.args = [ '5.6' ]
    end
  end

  config.vm.define 'ubuntu-trusty-php-7-0' do | vmconfig |
    vmconfig.vm.hostname = 'ansible-role-php-ubuntu-trusty-7-0'
    vmconfig.vm.box = 'fgrehm/trusty64-lxc'

    vmconfig.vm.provision 'shell' do |s|
      s.keep_color = true
      s.path = 'tests/init.sh'
      s.args = [ '7.0' ]
    end
  end

  config.vm.define 'ubuntu-trusty-hhvm' do | vmconfig |
    vmconfig.vm.hostname = 'ansible-role-php-ubuntu-trusty-hhvm'
    vmconfig.vm.box = 'fgrehm/trusty64-lxc'

    vmconfig.vm.provision 'shell' do |s|
      s.keep_color = true
      s.path = 'tests/init.sh'
      s.args = [ 'hhvm' ]
    end
  end
end
