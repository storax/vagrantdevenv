#!/bin/sh
sudo add-apt-repository "deb http://repository.spotify.com stable non-free"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 94558F59
sudo apt-get update

sudo apt-get install -y spotify-client

if [ `lsb_release -rs` = "15.04" ]; then
    cd ~
    wget https://launchpadlibrarian.net/201289896/libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb
    sudo dpkg --install libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb
    rm -f libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb
fi
