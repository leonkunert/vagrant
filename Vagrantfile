# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise32"
  config.vm.network :private_network, ip: "192.168.33.21"
  config.vm.provision :shell, :path => "install.sh"
  config.vm.synced_folder "www/", "/var/www", owner: "vagrant", group: "www-data", mount_options: ['dmode=775', 'fmode=775']
  config.vm.synced_folder "config/", "/etc/apache2"
end