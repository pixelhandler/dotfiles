#!/usr/bin/env bash
# Inspired by https://github.com/mathiasbynens/dotfiles/blob/master/brew.sh

# Install command-line tools using Homebrew.
if command -v brew > /dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install vim with luan and override system vi
brew install lua
brew install vim --with-lua --with-override-system-vi --with-python3 --without-python

# Install some tools
brew install ack
brew install ctags
brew install tmux
brew install watchman

# Python
brew install pyenv
brew install pyenv-virtualenv

# Redis
brew install redis

# Ruby
brew install rbenv
brew install ruby-build

# Remove outdated versions from the cellar.
brew cleanup
