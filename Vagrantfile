# -*- mode: ruby -*-
# vi: set ft=ruby :

# Might be needed if the default 10.20.1.2/24 pool is in use
#AutoNetwork.default_pool = '172.16.0.0/24'

Vagrant.configure('2') do |config|

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
    config.cache.synced_folder_opts = {
        type: :nfs,
        mount_options: ['rw', 'vers=3', 'tcp', 'nolock']
    }
  end

  if Vagrant.has_plugin?("vagrant-auto_network")
    config.vm.network :private_network, :auto_network => true
  end

  config.vm.synced_folder "~/dotfiles", "/home/vagrant/dotfiles"

end
