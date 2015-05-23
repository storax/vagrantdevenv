sudo apt-get update
sudo apt-get upgrade -y

declare -a pkgs=(
   fonts-dejavu
   fonts-inconsolata
   git-flow
   jq
)

for i in "${pkgs[@]}"
do
   echo Installing $i
   sudo apt-get install -y $i
   echo Finished installing $i
done

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
sudo apt-get install -y build-essential git cmake libqt4-dev libphonon-dev python2.7-dev libxml2-dev libxslt1-dev qtmobility-dev
echo Installing Pyside dependencies finished!

echo Installing Pyside Phonon VLC Backend
sudo apt-get install -y phonon-backend-vlc
echo Installing Pyside Phonon VLC Backend finished!


mkdir ~/projects
git clone https://gist.github.com/6402dc6c4759ebd8123e.git ~/projects/clonegithubrepos
cd ~/projects
source ~/projects/clonegithubrepos/clonegithubrepos.sh storax
find . -wholename '*/.git/config' -exec sed -i 's#https://github.com/#git@github.com:#g' {} +
cd ~

pyenv install 2.7.9
pyenv install 3.4.3
pyenv rehash
pyenv global 3.4.3
pyenv shell 3.4.3

pip install elpy virtualenvwrapper pyflakes
