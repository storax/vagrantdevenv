#!/bin/bash -eux

echo Start installing pyenv
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
echo Installation of pyenv finished!

git clone https://github.com/yyuu/pyenv-virtualenvwrapper.git ~/.pyenv/plugins/pyenv-virtualenvwrapper

pip install elpy virtualenvwrapper pyflakes

echo Creating python envs
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
pyenv install 2.7.9
pyenv install 3.4.3
pyenv rehash
pyenv global 3.4.3
pyenv shell 2.7.9
pip install elpy virtualenvwrapper pyflakes httpie
pyenv shell 3.4.3
pip install elpy virtualenvwrapper pyflakes httpie
