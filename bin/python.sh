#!/usr/bin/env bash

# https://github.com/yyuu/pyenv/blob/master/COMMANDS.md
pyenv install 3.4.5
pyenv rehash
pyenv global 3.4.5

# https://github.com/yyuu/pyenv-virtualen
# https://github.com/yyuu/pyenv-virtualenv#using-pyenv-virtualenv-with-pyenv
pyenv virtualenv 3.4.5