typeset -U path

# Add Racket
#path=("/Applications/Racket v5.3.5/bin" $path)

# Add TEX
# path=(/usr/texbin $path)

# Add Haskell
path=(~/.cabal/bin $path)

# Add Node
# path=(~/node_modules/.bin $path)

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
source /usr/local/bin/virtualenvwrapper.sh

export VISUAL=nvim
export EDITOR=nvim

export PATH

SSH_ENV="$HOME/.ssh/environment"

# Get sensitive environmental variables
source ~/.tokens.zsh

