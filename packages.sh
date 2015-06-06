#!/bin/bash -eux

sudo apt-get update
sudo apt-get upgrade -y

declare -a pkgs=(
   compizconfig-settings-manager
   firefox
   fonts-dejavu
   fonts-inconsolata
   gconf2
   git
   git-flow
   git-flow
   gitk
   guake
   jq
   pidgin
   pidgin-otr
   python-pip
   python2.7-dev
   python3.4-dev
   ruby
   ruby-dev
   systemd-sysv
   ubuntu-standard
   zlib1g-dev
   zsh
)

echo Installing ${pkgs[*]}
sudo apt-get install -y ${pkgs[*]}
echo Finished installing ${pkgs[*]}
