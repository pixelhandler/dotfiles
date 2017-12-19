#!/usr/bin/env bash

# https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu
# or try linuxbrew
#brew install neovim

sudo apt-get install software-properties-common

sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

# vim plug
# consider https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
# https://github.com/junegunn/vim-plug#neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# python extensions
sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo pip3 install --upgrade neovim

