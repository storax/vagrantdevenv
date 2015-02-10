sudo apt-get update
sudo apt-get upgrade -y

declare -a pkgs=(
   git-flow
   fonts-inconsolata
   fonts-dejavu
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
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm
echo Installing Pyenv dependencies finished!

echo Installing Pyside dependencies
sudo apt-get install build-essential git cmake libqt4-dev libphonon-dev python2.7-dev libxml2-dev libxslt1-dev qtmobility-dev
echo Installing Pyside dependencies finished!
