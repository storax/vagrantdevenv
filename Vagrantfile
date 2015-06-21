# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "storax/ubuntu-15.04-server-amd64"

  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "developmentenv15"
    vb.gui = true
    vb.cpus = 4
    vb.memory = "2048"
    vb.customize ["modifyvm", :id, "--vram", "128", "--monitorcount", "1", "--accelerate3d", "on", "--audio", "dsound", "--audiocontroller", "ac97"]
  end

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "ansible/site.yml"
  end
#  config.vm.provision "shell", path: "packages.sh", privileged: false
#  config.vm.provision "shell", path: "dotfiles.sh", privileged: false
#  config.vm.provision "shell", path: "zshell.sh", privileged: false
#  config.vm.provision "shell", path: "emacs.sh", privileged: false
#  config.vm.provision "shell", path: "pyenv.sh", privileged: false
#  config.vm.provision "shell", path: "pip2pi.sh", privileged: false
#  config.vm.provision "shell", path: "pyside.sh", privileged: false
#  config.vm.provision "shell", path: "travis.sh", privileged: false
#  config.vm.provision "shell", path: "gsettings.sh", privileged: false
#  config.vm.provision "shell", path: "cloneprojects.sh", privileged: false
#  config.vm.provision "shell", path: "misc.sh", privileged: false
#  config.vm.provision "shell", path: "spotify.sh", privileged: false
#  config.vm.provision "shell", path: "hub.sh", privileged: false
end
