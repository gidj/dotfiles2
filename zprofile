typeset -U path

# Add ruby gems
path=(/usr/local/opt/ruby/bin $path)

# Add virtualenvwrapper global variables
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
source /usr/local/bin/virtualenvwrapper.sh

export VISUAL=vim
export EDITOR=vim

export PATH
