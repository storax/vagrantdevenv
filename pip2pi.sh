#!/bin/bash -eux

sudo pip install pip2pi

echo Create pip2pi
mkdir ~/projects
cd ~/projects
mkdir pip2pi
cd pip2pi
pip2pi . pytest tox sphinx mock coverage wheel -n
cd ~
