# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "Debian7"

  config.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_debian-7.1.0_provisionerless.box"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :private_network, ip: "192.168.33.10"
  # config.vm.network :public_network,  ip: "192.168.33.11", bridge: "en0: Wi-Fi (AirPort)"
  config.vm.network :public_network
  config.ssh.forward_agent = true

  # memo
  # VBoxManage list bridgedifs |grep '^Name:'

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.run_list = [
      "base",
      "application::database",
      "application::webserver",
      "application::php",
      "application::ruby"
    ]
  end
end
