#!/bin/bash -eux

sudo apt-get update
sudo apt-get upgrade -y

# somehow xserver-xorg is buggy.
# reinstalling fixes it
sudo apt-get remove -y --purge xserver-xorg
sudo apt-get install -y xserver-xorg
sudo dpkg-reconfigure xserver-xorg

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
   virtualbox-guest-dkms
   virtualbox-guest-utils
   virtualbox-guest-x11
   zlib1g-dev
   zsh
)

echo Installing ${pkgs[*]}
sudo apt-get install -y ${pkgs[*]}
echo Finished installing ${pkgs[*]}
