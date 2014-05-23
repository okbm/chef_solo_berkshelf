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

 service "apache2" do
   supports :status => true, :restart => true, :reload => true
   action [:enable, :start]
 end


