#!/usr/bin/env bash
# Borrowed from https://github.com/mathiasbynens/dotfiles/blob/master/bootstrap.sh
# and https://github.com/toranb/dotfiles/blob/master/symlink.sh

cd "$(dirname "${BASH_SOURCE}")";

git pull origin ubuntu;

function doIt() {
  source ./bin/ssh.sh
  #source ./bin/z.sh
  rsync --exclude ".git/" \
    --exclude ".gitignore" \
    --exclude ".gitmodules" \
    --exclude ".DS_Store" \
    --exclude "bootstrap.sh" \
    --exclude "README.md" \
    --exclude "LICENSE.txt" \
    -avh --no-perms . ~;
  #chmod 700 ~/.ssht
  source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
  fi;
fi;

unset doIt;

