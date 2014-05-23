#
# Cookbook Name:: application
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
package "mysql-server" do
    action :install
end

service "mysql" do
    action [ :enable, :start]
end
