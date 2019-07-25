typeset -U path

fpath=(/usr/local/share/zsh-completions $fpath)

# Add Python3
path=(/usr/local/opt/python/libexec/bin $path)

# Python user site-packages are here
path=(~/.local/bin $path)

# Add Node
path=(~/node_modules/.bin $path)

# Add Homebrew sbin
path=(/usr/local/sbin $path)

# Add ~/bin
path=(~/bin $path)

export PATH

export GOPATH=$HOME/go

export VISUAL=nvim
export EDITOR=nvim

export TERM=tmux-256color
export SSH_ENV="$HOME/.ssh/environment"

export PIPENV_VENV_IN_PROJECT=true
export PYTHONUSERBASE="$HOME/.local"

# Aliases
alias lsa="ls -lahF"
alias tmat="tmux attach -t"
# alias ll="ls -alrtFG"
# alias la="ls -AF"
# alias l="ls -CF"
# alias m='less'
# alias ..='cd ..'
# alias ...='cd ..;cd ..'
# alias md='mkdir'
# alias cl='clear'
alias vi="nvim"
alias vim="nvim"

alias gla="git log --all --graph"

# Node
alias nlg="npm list -g --depth=0 2>/dev/null"
alias nll="npm list --depth=0 2>/dev/null"

# Be sure to always send a TERM that the other machines can understand
alias ssh='TERM=screen-256color ssh'
alias vagrant='TERM=screen-256color vagrant'

# Work aliases
alias vivid="~/vividseats"
alias findRmi='lsof -i:1099'

source ~/.zsecrets
