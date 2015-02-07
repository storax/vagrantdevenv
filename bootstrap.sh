sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install ubuntu-desktop -y --no-install-recommends
sudo apt-get upgrade -y

declare -a pkgs=(
    emacs
    git
    gnome-terminal
    indicator-application
    indicator-appmenu
    indicator-messages
    indicator-renderer
    indicator-session
    make
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
