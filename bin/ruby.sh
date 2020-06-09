#!/usr/bin/env bash

if command -v rbenv > /dev/null; then
  echo 'rbenv installed'
else
  #git clone https://github.com/pyenv/pyenv.git ~/.pyenv
  brew install rbenv
fi

rbenv install 2.7.1
rbenv rehash
rbenv global 2.7.1
gem install bundler
rbenv version
gem env home

