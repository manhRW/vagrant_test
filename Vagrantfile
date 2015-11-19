# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'CentOS-5.7-i386.box'
  config.vm.box_url = 'http://hglab.realworld.jp/boxes/CentOS-5.7-i386.box'
  config.vm.network "private_network", ip: "33.33.33.66"
  config.vm.provision "chef_solo" do |chef|
    chef.install = false
    chef.cookbooks_path = "cookbooks"
    chef.roles_path = "roles"
    chef.add_role "testapache"
  end
end
