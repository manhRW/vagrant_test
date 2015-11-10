#
# Cookbook Name:: phpmyadmin
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "epel-release" do
  action :install
end

execute "remi repo" do
  command "sudo rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-5.rpm"
end

%w{ phpMyAdmin }.each do |pkg|
  package pkg do
    options('--enablerepo=remi')
    action :install
  end
end

template "config.inc.php" do
  path "/etc/phpMyAdmin/config.inc.php"
  source "config.inc.php.erb"
  owner "root"
  group "root"
  mode "0644"
end

cookbook_file "/etc/httpd/conf.d/phpMyAdmin.conf" do
  source "phpMyAdmin.conf"
  owner "root"
  group "root"
  mode "0644"
end