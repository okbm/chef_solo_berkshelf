#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "apt-get update" do
    command "apt-get update"
end

%w{git zsh tmux curl tig make}.each do |pkg|
    package pkg do
        action :install
    end
end
