typeset -U path

# source "$HOME/.zsecrets"

# For whatever reason, this is required for nvm's default alias to work
PATH="/usr/local/bin:$(getconf PATH)"
fpath=(/usr/local/share/zsh-completions $fpath)

# Add Python3
path=(/usr/local/opt/python/libexec/bin $path)

# Python user site-packages are here
path=(~/.local/bin $path)

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# eval "$(pyenv init --path)"
# eval "$(pyenv virtualenv-init -)"

export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

# Python's Poetry
export POETRY_VIRTUALENVS_IN_PROJECT="true"

path=(~/.poetry/bin $path)

# Add Node
# path=(~/node_modules/.bin $path)

# Add Homebrew sbin
path=(/usr/local/sbin $path)

# Add ~/bin
# path=(~/bin $path)

# Go
path=(~/go/bin $path)

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
export JAVA_11_HOME=/opt/homebrew/Cellar/openjdk@11/11.0.12/libexec/openjdk.jdk/Contents/Home/bin

# alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java11='export JAVA_HOME=$JAVA_11_HOME'
java11

export PATH=$JAVA_HOME:$PATH

export HOMEBREW_NO_AUTO_UPDATE=1


# Sonar
export SONAR_HOME=/opt/homebrew/Cellar/sonar-scanner/4.6.2.2472_1/libexec
export SONAR=$SONAR_HOME/bin
export PATH=$SONAR:$PATH
alias loginaws="aws sso login && aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 212544173670.dkr.ecr.us-east-1.amazonaws.com"
# export NVM_DIR="$HOME/.nvm"
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

json_escape () {
    printf '%s' "$1" | python -c 'import json,sys; print(json.dumps(sys.stdin.read()))'
}
