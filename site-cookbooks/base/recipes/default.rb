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

%w{git zsh tmux curl tig make vim unzip nkf}.each do |pkg|
    package pkg do
        action :install
    end
end

bash "install locate" do
    user  "root"
    group "root"
    code <<-EOC
        sudo localedef -f UTF-8 -i ja_JP ja_JP
    EOC
end
