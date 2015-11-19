#
# Cookbook Name:: memcached
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w{ memcached gcc-c++ pkgconfig cyrus-sasl-devel }.each do |pkg|
  package pkg do 
    action :install
  end
end

bash "install memcached" do
  user "root"
  code <<-EOH
    cd /usr/local/src
    wget https://launchpad.net/libmemcached/1.0/1.0.4/+download/libmemcached-1.0.4.tar.gz --no-check-certificate
    tar xf libmemcached-1.0.4.tar.gz
    cd libmemcached-1.0.4
    sudo ./configure --prefix=/usr/local/libmemcached
    make
    make install
    echo /usr/local/libmemcached/lib/ > /etc/ld.so.conf.d/libmemcached.conf
    sudo /sbin/ldconfig -v
    pecl channel-update pecl.php.net
    pecl download memcached
    tar xf memcached*.tgz
    cd memcached*
    phpize
    sudo ./configure --with-libmemcached-dir=/usr/local/libmemcached/
    make
    make install
    /etc/init.d/httpd restart
    /etc/init.d/memcached restart
    EOH
end
