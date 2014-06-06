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

# DocumentRootの設定とか
 bash "install conf" do
     user  "root"
     group "root"
     #cwd   "/etc/apache2/sites-available/vagrant"
     code <<-EOC
        cat << EOF > /etc/apache2/sites-available/vagrant
        <VirtualHost *:80>

            DocumentRoot /home/vagrant/

            <Directory />
                Options FollowSymLinks
                AllowOverride None
            </Directory>
            <Directory /home/vagrant/>
                Options Indexes FollowSymLinks MultiViews
                AllowOverride None
                Order allow,deny
                allow from all
            </Directory>

            # ErrorLog ${APACHE_LOG_DIR}/error.log

            # Possible values include: debug, info, notice, warn, error, crit,
            # alert, emerg.
            LogLevel warn

            # LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-agent}i\"" CustomLog
            # CustomLog ${APACHE_LOG_DIR}/access.log combined

        </VirtualHost>
        EOF
     EOC

     creates "/etc/apache2/sites-available/vagrant"
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


