#!/bin/bash -eux

mkdir ~/projects
git clone https://gist.github.com/6402dc6c4759ebd8123e.git ~/projects/clonegithubrepos
cd ~/projects
zsh ~/projects/clonegithubrepos/clonegithubrepos.sh storax
find . -wholename '*/.git/config' -exec sed -i 's#https://github.com/#git@github.com:#g' {} +
cd ~
