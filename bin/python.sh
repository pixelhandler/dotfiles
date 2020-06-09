#!/usr/bin/env bash

if command -v pyenv > /dev/null; then
  echo 'pyenv installed'
else
  #git clone https://github.com/pyenv/pyenv.git ~/.pyenv
  brew install pyenv
fi
if command -v pyenv 1>/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
fi

# https://github.com/yyuu/pyenv/blob/master/COMMANDS.md
pyenv install 3.8.3
pyenv rehash
pyenv global 3.8.3

# https://github.com/yyuu/pyenv-virtualen
# https://github.com/yyuu/pyenv-virtualenv#using-pyenv-virtualenv-with-pyenv
pyenv virtualenv 3.8.3

