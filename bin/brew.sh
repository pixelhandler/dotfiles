#!/usr/bin/env bash
# http://linuxbrew.sh/

sudo apt-get install build-essential curl file git python-setuptools

# Install command-line tools using Homebrew.
if command -v brew > /dev/null; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

  test -d ~/.linuxbrew && PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
  test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
  test -r ~/.bash_profile && echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.bash_profile
  echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.profile
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install some tools
brew install ack
#brew install ctags
brew install tmux

# Python
#brew install pyenv
#brew install pyenv-virtualenv

# Redis
#brew install redis

# Ruby
#brew install rbenv
#brew install ruby-build

# Remove outdated versions from the cellar.
brew cleanup

