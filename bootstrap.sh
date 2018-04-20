#!/usr/bin/env bash
# Borrowed from https://github.com/mathiasbynens/dotfiles/blob/master/bootstrap.sh
# and https://github.com/toranb/dotfiles/blob/master/symlink.sh

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
  source ./bin/ssh.sh
  git submodule init
  git submodule update
  git submodule foreach git submodule init
  git submodule foreach git submodule update
  source ./bin/vim.sh
  rsync --exclude ".git/" \
    --exclude ".gitignore" \
    --exclude ".gitmodules" \
    --exclude ".DS_Store" \
    --exclude "bootstrap.sh" \
    --exclude "README.md" \
    --exclude "LICENSE.txt" \
    -avh --no-perms . ~;
  chmod 700 ~/.ssh
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

echo -n "Would you like to configure your git name and email? (y/n) => "; read answer
if [[ $answer = "Y" ]] || [[ $answer = "y" ]]; then
  echo -n "What is your git user name => "; read name
  git config --global user.name "$name"
  echo -n "What is your git email => "; read email
  git config --global user.email "$email"
fi

unset doIt;
