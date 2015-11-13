# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'CentOS-5.7-i386.box'
  config.vm.box_url = 'http://hglab.realworld.jp/boxes/CentOS-5.7-i386.box'
  config.vm.network "private_network", ip: "33.33.33.66"
  config.vm.provision "chef_solo" do |chef|
    chef.install = false
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "selinux"
    chef.add_recipe "apache"
    chef.add_recipe "php53"
    chef.add_recipe "mysql"
    chef.add_recipe "phpmyadmin"
    chef.add_recipe "memcached"
    chef.add_recipe "postfix"
  end
  config.vm.provision "shell", path: "sh/test.sh"
end
