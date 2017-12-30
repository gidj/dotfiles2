typeset -U path

# Autoenv files
export AUTOENV_FILE_ENTER=".env.zsh"
export AUTOENV_FILE_LEAVE=".out.zsh"

# Add Racket
#path=("/Applications/Racket v5.3.5/bin" $path)

# Add TEX
# path=(/usr/texbin $path)

# Add Haskell
path=(~/.cabal/bin $path)

# Add Python
path=(/usr/local/opt/python/libexec/bin $path)

# Add Node
# path=(~/node_modules/.bin $path)

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
source /usr/local/bin/virtualenvwrapper.sh

export VISUAL=nvim
export EDITOR=nvim

export PATH

export TERM=tmux-256color
SSH_ENV="$HOME/.ssh/environment"

# Make sure keys are loaded in ssh-agent
if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval ssh-agent -s
    ssh-add
fi

# Aliases
alias ll="ls -alrtFG"
alias lsa="ls -lahF"
alias la="ls -AF"
alias l="ls -CF"
alias m='less'
alias ..='cd ..'
alias ...='cd ..;cd ..'
alias md='mkdir'
alias cl='clear'
alias sicp-racket='racket -ip neil/sicp'
alias vi="nvim"
alias vim="nvim"

# Eclimd
alias eclimd='/Applications/Eclipse.app/Contents/Eclipse/eclimd'
