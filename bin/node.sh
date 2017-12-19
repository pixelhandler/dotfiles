#!/usr/bin/env bash

if [ ! -d $HOME"/.nvm" ]; then   
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
  echo "$(command -v nvm)"
fi

source ~/.bashrc

nvm install --lts
nvm alias default lts/*
nvm use default

## Install NPM modules for Ember development
#npm install -g ember-cli yarn

npm -g ls --depth=0

