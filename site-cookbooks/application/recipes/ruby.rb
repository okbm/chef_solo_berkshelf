#
# Cookbook Name:: application
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
# ruby
# sudo aptitude install libyaml-ruby libzlib-ruby libopenssl-ruby ruby-dev libmysqld-dev

 %w{libyaml-ruby libzlib-ruby libopenssl-ruby ruby-dev libmysqld-dev}.each do |suffix|
     package suffix do
         action :install
     end
 end

# rbenv
