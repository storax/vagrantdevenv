#!/bin/bash -eux

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get remove -y --purge xserver-xorg
sudo apt-get install -y xserver-xorg
sudo dpkg-reconfigure xserver-xorg


declare -a pkgs=(
   emacs
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
   phonon-backend-vlc
   pidgin
   pidgin-otr
   python-pip
   python2.7-dev
   python3.4-dev
   qtmobility-dev
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

sudo gem install homesick
homesick clone storax/storaxcastle
homesick symlink storaxcastle

sudo pip install virtualenvwrapper

echo Changing homeshell to zsh
sudo chsh -s $(which zsh) vagrant

echo Start downloading antigen
curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/antigen.zsh
echo Downloading antigen finished!

echo Start installing pyenv
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
echo Installation of pyenv finished!

git clone https://github.com/yyuu/pyenv-virtualenvwrapper.git ~/.pyenv/plugins/pyenv-virtualenvwrapper

echo Installing Pyenv dependencies
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm
echo Installing Pyenv dependencies finished!

echo Installing Pyside dependencies
sudo apt-get install -y build-essential git cmake libqt4-dev libphonon-dev python2.7-dev python3.4-dev libxml2-dev libxslt1-dev qtmobility-dev
echo Installing Pyside dependencies finished!

echo Installing Pyside Phonon VLC Backend
sudo apt-get install -y phonon-backend-vlc
echo Installing Pyside Phonon VLC Backend finished!

echo install latest emacs
cd ~
mkdir emacs-src && cd emacs-src
wget http://ftpmirror.gnu.org/emacs/emacs-24.5.tar.gz
tar xvf emacs-24.5.tar.gz
sudo debconf-set-selections <<< "postfix postfix/mailname string vagrantdevenv.vm"
sudo debconf-set-selections <<< "postfix postfix/main_mailer_type string 'No configuration'"
sudo apt-get build-dep emacs24 -y
cd emacs-24.5
./configure
make
sudo apt-get install checkinstall -y
sudo checkinstall -y
cd ~

mkdir ~/projects
git clone https://gist.github.com/6402dc6c4759ebd8123e.git ~/projects/clonegithubrepos
cd ~/projects
zsh ~/projects/clonegithubrepos/clonegithubrepos.sh storax
find . -wholename '*/.git/config' -exec sed -i 's#https://github.com/#git@github.com:#g' {} +
cd ~


echo Creating python envs
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
pyenv install 2.7.9
pyenv install 3.4.3
pyenv rehash
pyenv global 3.4.3
pyenv shell 3.4.3

pip install elpy virtualenvwrapper pyflakes pip2pi

echo Create pip2pi
cd ~/projects
mkdir pip2pi
cd pip2pi
pip2pi . pytest tox sphinx mock coverage wheel -n
cd ~

echo Building pyside
pip install wheel
wget https://pypi.python.org/packages/source/P/PySide/PySide-1.2.2.tar.gz
tar -xvzf PySide-1.2.2.tar.gz
cd PySide-1.2.2
python setup.py bdist_wheel --qmake=/usr/bin/qmake-qt4 --standalone
cp dist/*.whl ~/projects/pip2pi/
dir2pi ~/projects/pip2pi -n
cd ~

echo install travis
sudo gem install travis
echo finish installing travis

gsettings set com.canonical.Unity.Launcher favorites "['application://org.gnome.Nautius.desktop','application://firefox.desktop','application://unity-control-center.desktop','application://emacs.desktop','appliaction://pidgin.desktop','unity://running-apps','unity://expo-icon','unity://devices']"
gconftool-2 --set "/app/guake/style/background/transparency" --type=int 15
gconftool-2 --set "/app/guake/general/window_tabbar" --type=bool true
gconftool-2 --set "/app/guake/general/window_height" --type=int 75

