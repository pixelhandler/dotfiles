#!/usr/bin/env bash
# Setup vim temp/backup folders and link config

mkdir -p ~/.vim/_backup
mkdir -p ~/.vim/_temp

if [ ! -L ~/.vimrc ]; then
  ln -s ~/.vim/.vimrc ~/.vimrc
fi