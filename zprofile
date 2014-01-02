typeset -U path

# Add ruby gems
#path=(/usr/local/opt/ruby/bin $path)

# Add virtualenvwrapper global variables
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv2
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
source /usr/bin/virtualenvwrapper.sh

export VISUAL=vim
export EDITOR=vim

export PATH
