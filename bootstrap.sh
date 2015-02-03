sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install ubuntu-desktop -y
sudo apt-get install git -y
sudo apt-get install emacs -y
sudo apt-get install zsh -y
sudo apt-get install guake -y
sudo gem install homesick
homesick clone storax/storaxcastle
homesick symlink storaxcastle
