#
# Cookbook Name:: application
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

 package "apache2" do
   action :install
 end

 bash "rewrite" do
   code <<-EOC
       sudo a2enmod rewrite
   EOC
 end

 template "/etc/apache2/sites-available/vagrant" do
     source "apache.erb"
     owner "root"
     group "root"
     mode 0644
 end

 bash "install link" do
     user  "root"
     group "root"
     code <<-EOC
        sudo ln -s /etc/apache2/sites-available/vagrant /etc/apache2/sites-enabled/vagrant
        sudo rm /etc/apache2/sites-enabled/000-default
     EOC

     creates "/etc/apache2/sites-enabled/vagrant"
 end
 service "apache2" do
   supports :status => true, :restart => true, :reload => true
   action [:enable, :start]
 end


