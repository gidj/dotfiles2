typeset -U path

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

# Get sensitive environmental variables
source ~/.tokens.zsh

# Make sure keys are loaded in ssh-agent
if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval ssh-agent -s
    ssh-add
    ssh-add ~/.ssh/*.pem
fi
