#
# Cookbook Name:: php53
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w{ php53 php53-devel php53-mysql php53-cli php53-common php53-pdo php-pear }.each do |pkg|
  package pkg do
    action :install
  end
end

template "/etc/php.ini" do
  source "php.ini.erb"
  owner "root"
  group "root"
  mode "0644"
end

execute "httpd restart" do
  command "sudo /etc/init.d/httpd restart"
end