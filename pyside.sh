#!/bin/bash -eux

echo Installing Pyside dependencies
sudo apt-get install -y build-essential git cmake libqt4-dev libphonon-dev python2.7-dev python3.4-dev libxml2-dev libxslt1-dev qtmobility-dev
echo Installing Pyside dependencies finished!

echo Installing Pyside Phonon VLC Backend
sudo apt-get install -y phonon-backend-vlc
echo Installing Pyside Phonon VLC Backend finished!

echo Building pyside
pip install wheel
wget https://pypi.python.org/packages/source/P/PySide/PySide-1.2.2.tar.gz
tar -xvzf PySide-1.2.2.tar.gz
cd PySide-1.2.2
python setup.py bdist_wheel --qmake=/usr/bin/qmake-qt4 --standalone
cp dist/*.whl ~/projects/pip2pi/
dir2pi ~/projects/pip2pi -n
cd ~
