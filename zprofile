typeset -U path

# Add Homebrew
path=(/usr/local/bin $path)

# Add Racket
path=("/Applications/Racket v5.3.5/bin" $path)

# Add ruby gems
path=(/usr/local/opt/ruby/bin $path)

# Add virtualenvwrapper global variables
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
source /usr/local/bin/virtualenvwrapper.sh

export VISUAL=vim
export EDITOR=vim

export PATH
