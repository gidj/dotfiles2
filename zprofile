typeset -U path

# For whatever reason, this is required for nvm's default alias to work
PATH="/usr/local/bin:$(getconf PATH)"

fpath=(/usr/local/share/zsh-completions $fpath)

# Add Python3
path=(/usr/local/opt/python/libexec/bin $path)
# path=(/usr/local/opt/python@3.8/bin $path)

# Python user site-packages are here
path=(~/.local/bin $path)

# Python's Poetry
path=(~/.poetry/bin $path)

# Add Node
# path=(~/node_modules/.bin $path)

# Add Homebrew sbin
path=(/usr/local/sbin $path)

# Add ~/bin
path=(~/bin $path)

# Add Amazon Toolbox
path=(~/.toolbox/bin $path)

# Rust
path=(~/.cargo/bin $path)

# Needed for Virtual envs for BrazilPython
export BRAZIL_CLI_BIN=$HOME/.toolbox/bin

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

# export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
# export JAVA_11_HOME=$(/usr/libexec/java_home -v11)

# alias java8='export JAVA_HOME=$JAVA_8_HOME'
# alias java11='export JAVA_HOME=$JAVA_11_HOME'
# java11

# Amazon aliases
alias bb='brazil-build'
alias workplace='cd ~/workplace'

export HOMEBREW_NO_AUTO_UPDATE=1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH

# export PATH="$HOME/.poetry/bin:$PATH"
