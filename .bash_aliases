# Aliases

# Python
alias ss="python -m SimpleHTTPServer"

# Ember
alias em="ember"

# Git
alias co='git checkout'
alias pull='git pull --rebase'
alias pullup='git pull upstream master'
alias push='git push'
alias ga='git add .'
alias gs='git status'
alias gb='git branch'
alias gf='git fetch'
alias gc='git commit -am'
alias gr='git rebase'
alias gt='git tag'
alias go='git remote -v'

alias gc-wip='git add -A && git commit -m "WIP [ci skip]"'
alias gundo='git reset --soft head~'

#alias tmux="TERM=xterm-256color tmux"

# ember-cli
alias nombom='rm -rf node_modules bower_components && npm cache clear && bower cache clean && npm install && bower install'
alias nom='npm cache clean && rm -rf node_modules && mkdir node_modules && touch node_modules/.metadata_never_index && npm install'
alias bom='bower cache clean && rm -rf bower_components && mkdir bower_components && touch bower_components/.metadata_never_index && bower install'

# MacVim
#alias vim='mvim -v'


