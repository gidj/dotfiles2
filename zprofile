typeset -U path

fpath=(/usr/local/share/zsh-completions $fpath)

# Add Python3
path=(/usr/local/opt/python/libexec/bin $path)
# path=(/usr/local/opt/python@3.8/bin $path)

# Python user site-packages are here
path=(~/.local/bin $path)

# Python's Poetry
path=(~/.poetry/bin $path)

# Add Node
path=(~/node_modules/.bin $path)

# Add Homebrew sbin
path=(/usr/local/sbin $path)

# For oursql stuff
path=(/usr/local/opt/mysql-client/bin $path)

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

export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)

alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java11='export JAVA_HOME=$JAVA_11_HOME'
java11

export PATH="$HOME/.poetry/bin:$PATH"

# Handle regression with postgres 12.x client
export GSSENCMODE=disable
export PGGSSENCMODE=disable
