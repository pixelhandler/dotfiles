# .bashrc

export EDITOR=vim

PATH="/Users/$(whoami)/bin:$PATH:/usr/local/bin:/usr/local/sbin:$PATH"
export PATH=$PATH

# z script https://github.com/rupa/z.git
. ~/bin/z/z.sh
# alias zadd="_z --add \"\$(pwd -P 2>/dev/null)\" 2>/dev/null;"

# python
if command -v pyenv > /dev/null; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# Ruby
if command -v rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

# nvm source ~/.nvm/nvm.sh
export NVM_DIR="/Users/$(whoami)/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
#export NODE_PATH="/usr/local/bin/node:/usr/local/lib/node_modules:$NODE_PATH"

# ssh
ssh-add -A &> /dev/null
export GIT_SSH_COMMAND='ssh -i ~/.ssh/id_rsa'

# tmux
#export TMUX_TMPDIR=/usr/local/var/tmux-sessions

flipTable(){
  echo "(╯°□°）╯︵ ┻━┻"
}

# prompt
showBranch(){
  if [$(pwd | grep "code|www") != ""]; then
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/±\1/'
    # | tr "\n" ' '
  fi
}
#export PS1='\e[01;32m\u\e[34m@\H \e[01;31m\w \e[32;40m$(showBranch) \n\[\e[30m\]\[\e[33m\]⚡ \[\e[0m\]'
export PS1='\e[01;32m\h \e[01;31m\w \e[34m$(showBranch) \n\[\e[30m\]\[\e[33m\]⚡ \[\e[0m\]'

# fix error with installing pg gem
export ARCHFLAGS="-arch x86_64"

# Aliases 
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi
alias sq=squash
alias cb=current_branch
alias pushf=force_push

squash(){
  git rebase -i HEAD~$1
}

current_branch(){
  gb 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

hist(){
  git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short -$1
}

last(){
  git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short -1
}

changed(){
  git show --pretty="format:" --name-only $1
}

sync(){
  gf --all && co master && pull && gs && last
}

blam(){
  push origin $(cb) $@
}

syncup(){
  gf --all && co master && pullup && blam && gs && last
  #co develop && pulldev && blam && gs && last
}

force_push(){
  branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')
  if [ $branch == "master" ]; then
    echo "*** [Policy] never force push master"
  else
    echo "*** Force push branch: $branch to origin"
    push --force-with-lease origin $branch
  fi
}

