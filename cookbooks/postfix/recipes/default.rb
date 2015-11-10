#
# Cookbook Name:: postfix
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w{ postfix mailx }.each do |pkg|
  package pkg do  
    action :install
  end
end

template "/etc/postfix/main.cf" do
  source "main.cf.erb"
  owner "root"
  group "root"
  mode 0644
end

service "sendmail" do
  supports :status => false, :restart => false, :reload => false
  action [ :disable, :stop ]
end

service "postfix" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

execute "mta" do
  command "/usr/sbin/alternatives --set mta /usr/sbin/sendmail.postfix"
end
