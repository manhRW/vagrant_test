#
# Cookbook Name:: selinux
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "disable selinux enforcement" do
  only_if "selinuxenabled"
  command "setenforce 0"
  action :run
end

template "/etc/selinux/config" do
  source "sysconfig/selinux.erb"
  variables(
    :selinux => "disabled",
    :selinuxtype => "targeted"
  )
end
