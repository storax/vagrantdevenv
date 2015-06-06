# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "storax/ubuntu-15.04-server-amd64"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "developmentenv15"
    vb.gui = true
    vb.cpus = 4
    vb.memory = "2048"
    vb.customize ["modifyvm", :id, "--vram", "128", "--monitorcount", "1", "--accelerate3d", "on", "--audio", "dsound", "--audiocontroller", "ac97"]
  end

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", path: "packages.sh", privileged: false
  config.vm.provision "shell", path: "dotfiles.sh", privileged: false
  config.vm.provision "shell", path: "zshell.sh", privileged: false
  config.vm.provision "shell", path: "emacs.sh", privileged: false
  config.vm.provision "shell", path: "pyenv.sh", privileged: false
  config.vm.provision "shell", path: "pip2pi.sh", privileged: false
  config.vm.provision "shell", path: "pyside.sh", privileged: false
  config.vm.provision "shell", path: "travis.sh", privileged: false
  config.vm.provision "shell", path: "gsettings.sh", privileged: false
  config.vm.provision "shell", path: "cloneprojects.sh", privileged: false
  config.vm.provision "shell", path: "misc.sh", privileged: false
  config.vm.provision "shell", path: "spotify.sh", privileged: false
end
