#!/bin/sh
wget https://github.com/github/hub/releases/download/v2.2.1/hub-linux-amd64-2.2.1.tar.gz
tar xf hub-linux-amd64-2.2.1.tar.gz
sudo mv hub-linux-amd64-2.2.1/hub /usr/bin/
rm -rf hub-linux-amd64-2.2.1
rm -f hub-linux-amd64-2.2.1.tar.gz
