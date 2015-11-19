#
# Cookbook Name:: cron
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "vixie-cron" do
  action :install
end

service "crond" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

template "/var/spool/cron/vagrant" do
  source "vagrant.erb"
  owner "vagrant"
  group "root"
  mode "0600"
end
