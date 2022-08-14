# Python's Poetry
export POETRY_VIRTUALENVS_IN_PROJECT="true"

path=(~/.poetry/bin $path)

# Add Homebrew sbin
path=(/usr/local/sbin $path)

# Go
path=(~/go/bin $path)

# Rust
path=(~/.cargo/bin $path)

export VISUAL=nvim
export EDITOR=nvim

export TERM=tmux-256color
export SSH_ENV="$HOME/.ssh/environment"

export PIPENV_VENV_IN_PROJECT=true
export PYTHONUSERBASE="$HOME/.local"

alias vi="nvim"
alias vim="nvim"

alias gla="git log --all --graph"

# Be sure to always send a TERM that the other machines can understand
alias ssh='TERM=screen-256color ssh'

export HOMEBREW_NO_AUTO_UPDATE=1
