# helper for Vagrant routines
module VagrantExtras

  # check and install required Vagrant plugins
  def check_plugins (required_plugins)
    required_plugins.each do |plugin|
      if Vagrant.has_plugin? plugin
        system "echo OK: #{plugin} already installed."
      else
        system "echo Required plugin isn't installed: #{plugin} ..."
        system "vagrant plugin install #{plugin}"
      end
    end
  end

  # Set entries in hosts file
  # https://github.com/cogitatio/vagrant-hostsupdater
  def update_hosts_file(config, hostname)
    return unless Vagrant.has_plugin? 'vagrant-hostsupdater'

    config.hostsupdater.remove_on_suspend = true
    config.vm.hostname = hostname
    #config.hostsupdater.aliases = ['dev.canvas.growthhackers.com']
  end

  def cache_scope(config)
    if Vagrant.has_plugin?("vagrant-cachier")
      config.cache.scope = :box
    end
  end

  def ansible_playbook_provision(config, playbook)
    config.vm.provision "ansible" do |ansible|
      ansible.playbook = playbook
    end
  end
end