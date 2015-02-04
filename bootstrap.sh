sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install ubuntu-desktop -y --without-recommends
sudo apt-get install git -y
sudo apt-get install gitk -y
sudo apt-get install emacs -y
sudo apt-get install zsh -y
sudo apt-get install guake -y
sudo gem install homesick
homesick clone storax/storaxcastle
homesick symlink storaxcastle
sudo apt-get python-pip -y
sudo pip install virtualenvwrapper
sudo chsh -s $(which zsh)
curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/antigen.zsh
