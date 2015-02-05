sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install xubuntu-desktop  -y
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
echo Changing Home Shell to zsh
sudo chsh -s $(which zsh) vagrant
echo Start downloading antigen
curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/antigen.zsh
echo Downloading antigen finished!
