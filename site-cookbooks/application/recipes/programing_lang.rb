#
# Cookbook Name:: application
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
 %w{php5 php-pear php5-cli php5-common php5-dev php5-gd php5-mysql libapache2-mod-php5 php-apc openjdk-6-jre}.each do |suffix|
     package suffix do
         action :install
     end
 end

 # sudo aptitude install libyaml-ruby libzlib-ruby libopenssl-ruby ruby-dev libmysqld-dev

