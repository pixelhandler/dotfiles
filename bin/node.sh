#!/usr/bin/env bash

if [ ! -d $HOME"/.nvm" ]; then   
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

  echo "$(command -v nvm)"
fi

source ~/.bash_profile

nvm install --lts
nvm alias default lts/*
nvm use default

## Install NPM modules for Ember development
#npm install -g ember-cli yarn

npm install -g yarn
npm install -g neovim
npm install -g typescript

npm -g ls --depth=0
