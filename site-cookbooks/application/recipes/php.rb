#
# Cookbook Name:: application
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
 %w{php5 php-pear php5-cli php5-common php5-dev php5-gd php5-mysql libapache2-mod-php5 php-apc openjdk-6-jre sqlite3}.each do |suffix|
     package suffix do
         action :install
     end
end

# phpunit
#channels = %w{pear.phpunit.de components.ez.no pear.symfony-project.com}
#channels.each do |chan|
#  php_pear_channel chan do
#    action [:discover, :update]
#  end
#end
#
#php_pear "HTTP_Request2" do
#  preferred_state "beta"
#  action :install
#end
#
#php_pear "XML_RPC2" do
#  action :install
#end
#
#php_pear "PHPUnit" do
#  channel "phpunit"
#  action :install
#end
