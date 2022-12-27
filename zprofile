# This needs to be present for Apple Silicon
path=(/opt/homebrew/bin $path)

eval "$(brew shellenv)"

export HOMEBREW_NO_AUTO_UPDATE=1

# zsh completions
FPATH="${HOMEBREW_PREFIX}/share/zsh/site-functions:${FPATH}"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source "${HOMEBREW_PREFIX}/opt/asdf/libexec/asdf.sh"
source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"

# Brazil completion
SITE_FUNCTIONS=$(echo ${HOMEBREW_CELLAR}/env-improvement/*/share/zsh/site-functions(N) | awk '{print $1}')
fpath=($SITE_FUNCTIONS $fpath)
autoload -U $SITE_FUNCTIONS/*(:t)

# >>>> Vagrant command completion (start)
fpath=(/opt/vagrant/embedded/gems/2.3.4/gems/vagrant-2.3.4/contrib/zsh $fpath)
# <<<<  Vagrant command completion (end)

# export JAVA_HOME="/Library/Java/JavaVirtualMachines/amazon-corretto-18.jdk/Contents/Home"

# Python's Poetry
export POETRY_VIRTUALENVS_IN_PROJECT="true"
export PIPENV_VENV_IN_PROJECT=true
export PYTHONUSERBASE="$HOME/.local"
path=(~/.poetry/bin $path)
export PIPENV_VENV_IN_PROJECT=true

# Add Python3
# path=(/usr/local/opt/python/libexec/bin $path)

# Python user site-packages are here
path=(~/.local/bin $path)

# Add Homebrew sbin
path=(/usr/local/sbin $path)

# Go
path=(~/go/bin $path)

# Rust
path=(~/.cargo/bin $path)

# Amazon
path=(~/.toolbox/bin $path)

export VISUAL=nvim
export EDITOR=nvim

export TERM=tmux-256color
export SSH_ENV="$HOME/.ssh/environment"

alias vi="nvim"
alias vim="nvim"

alias gla="git log --all --graph"

# Be sure to always send a TERM that the other machines can understand
alias ssh='TERM=screen-256color ssh'
