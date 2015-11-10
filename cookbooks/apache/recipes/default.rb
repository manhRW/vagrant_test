#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "httpd" do
  action :install
end

service "httpd" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

execute "welcome.conf.back" do
  command "mv /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf.back"
  only_if {
    File.exists?("/etc/httpd/conf.d/welcome.conf")
  }
end

service 'iptables' do
  action :stop
end

template "/etc/httpd/conf.d/testapache.local.conf" do
  source "httpd.conf.erb"
  owner "apache"
  group "apache"
  mode "0644"
end