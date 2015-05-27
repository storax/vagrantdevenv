#!/bin/bash -eux

echo install latest emacs
cd ~
mkdir emacs-src && cd emacs-src
wget http://ftpmirror.gnu.org/emacs/emacs-24.5.tar.gz
tar xvf emacs-24.5.tar.gz

# we have to configure postfix here because
# else we would get stuck in the configuration window
sudo debconf-set-selections <<< "postfix postfix/mailname string vagrantdevenv.vm"
sudo debconf-set-selections <<< "postfix postfix/main_mailer_type string 'No configuration'"

sudo apt-get build-dep emacs24 -y
cd emacs-24.5
./configure
make
sudo apt-get install checkinstall -y
sudo checkinstall -y
cd ~

sudo apt-get install -y python-pyqt5 python-pyqt5.qtwebkit
pyenv shell system
sudo pip install epc

wget http://sourceforge.net/projects/python-xlib/files/python-xlib/0.15rc1/python-xlib-0.15rc1.tar.gz
tar -xf python-xlib-0.15rc1.tar.gz
cd python-xlib-0.15rc1
sudo python setup.py install
cd ..
rm -rf python-xlib-0.15rc1.tar.gz
rm -rf python-xlib-0.15rc1
