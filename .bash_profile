# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

PATH="$PATH:/usr/local/bin:/usr/local/sbin:$PATH"
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi
# export PATH=$PATH
if command -v brew 1>/dev/null 2>&1; then
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi
if command -v brew > /dev/null; then
  export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
  export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
  export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
fi

# default editor
export EDITOR=nvim

# z script https://github.com/rupa/z.git
if [ -f ~/bin/z/z.sh ]; then
  . ~/bin/z/z.sh
  # alias zadd="_z --add \"\$(pwd -P 2>/dev/null)\" 2>/dev/null;"
fi

# python
if command -v pyenv > /dev/null; then
  export PATH="/home/linuxbrew/.linuxbrew/opt/python@3.8/bin:$PATH"
  export PKG_CONFIG_PATH="/home/linuxbrew/.linuxbrew/opt/python@3.8/lib/pkgconfig"
fi
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  #eval "$(pyenv virtualenv-init -)"
fi
# Ruby
if command -v rbenv > /dev/null; then
  eval "$(rbenv init -)"
  export PATH="$HOME/.rbenv/bin:$PATH"
  export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
fi

# nvm source ~/.nvm/nvm.sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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

# Aliases 
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi
alias sq=squash
alias cb=current_branch
alias pushf=force_push

# Local settings
if [ -f ~/.profile ]; then
  source ~/.profile
fi

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

