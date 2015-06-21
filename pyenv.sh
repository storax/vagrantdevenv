#!/bin/bash -eux

echo Start installing pyenv
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
echo Installation of pyenv finished!

git clone https://github.com/yyuu/pyenv-virtualenvwrapper.git ~/.pyenv/plugins/pyenv-virtualenvwrapper

declare -a versions=(
    2.7.9
    3.4.3
)

declare -a pkgs=(
    httpie
    elpy
    pyflakes
    virtualenvwrapper
)

sudo pip install -U pip
sudo pip install ${pkgs[*]}

echo Creating python envs
export PYTHON_CONFIGURE_OPTS="--enable-unicode=ucs4 --enable-shared"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
for version in "${versions[@]}"
do
    pyenv install $version
    pyenv rehash
    pyenv shell $version
    pip install -U pip
    pip install ${pkgs[*]}
done
pyenv global 3.4.3
pyenv shell 3.4.3
