sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install ubuntu-desktop -y --no-install-recommends
sudo apt-get upgrade -y


declare -a pkgs=(
    app-install-data-partner
    emacs
    firefox
    gcc
    git
    gitk
    gnome-disk-utility
    gnome-terminal
    guake
    indicator-application
    indicator-appmenu
    indicator-messages
    indicator-renderer
    indicator-session
    make
    network-manager-gnome
    overlay-scrollbar
    python-pip
    ubuntu-system-settings
    unity-lens-applications
    unity-lens-files
    zsh
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
