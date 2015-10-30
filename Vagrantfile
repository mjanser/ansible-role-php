Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/trusty64'

  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.synced_folder '.', '/vagrant/ansible-role-php'

  config.vm.provider 'lxc' do |lxc, override|
    override.vm.box = 'fgrehm/trusty64-lxc'
  end

  config.vm.provision 'shell' do |s|
    s.keep_color = true
    s.path = 'tests/init.sh'
    s.args = [ENV.fetch('PHP_VERSION', '5.6')]
  end
end
