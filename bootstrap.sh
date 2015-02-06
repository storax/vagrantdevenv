sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install ubuntu-desktop -y --no-install-recommends

sudo apt-get install app-install-data-partner -y
sudo apt-get install firefox -y
sudo apt-get install gcc -y
sudo apt-get install gnome-disk-utility -y
sudo apt-get install gnome-screensaver -y
sudo apt-get install gnome-terminal -y
sudo apt-get install make -y

sudo apt-get upgrade -y
sudo apt-get install git -y
sudo apt-get install gitk -y
sudo apt-get install emacs -y
sudo apt-get install zsh -y
sudo apt-get install guake -y
sudo apt-get install python-pip -y

sudo gem install homesick
homesick clone storax/storaxcastle
homesick symlink storaxcastle

sudo pip install virtualenvwrapper

echo Changing homeshell to zsh
sudo chsh -s $(which zsh) vagrant

echo Start downloading antigen
curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/antigen.zsh
echo Downloading antigen finished!
