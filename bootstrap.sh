sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install  -y --no-install-recommends ubuntu-desktop
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

sudo apt-get clean
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
cat /dev/null > ~/.bash_history && history -c && exit
