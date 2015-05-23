# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

require './lib/vagrant_extras'
extend VagrantExtras

# check and install required Vagrant plugins
check_plugins(%w(vagrant-hostsupdater vagrant-vbguest vagrant-cachier))

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box_url = 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box'
  config.vm.box = 'trusty64'
  config.vm.synced_folder ".", "/vagrant", nfs: true
  config.vm.network "private_network", ip: '192.168.77.40'
  config.vm.provider "virtualbox" do |v|
    v.memory = 2096
    v.cpus = 2
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--name", "LedShop"]
  end

  # Set entries in hosts file
  update_hosts_file(config, 'ledshop.local')

  # Enable cache
  cache_scope(config)

  # Ansible playbook provision
  ansible_playbook_provision(config, 'ansible/led_shop.yml')
end
