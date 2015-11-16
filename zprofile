typeset -U path

# Add Homebrew
# path=(/usr/local/bin $path)

# Add Racket
#path=("/Applications/Racket v5.3.5/bin" $path)

# Add ruby gems
#path=(/usr/local/opt/ruby/bin $path)

# Add TEX
# path=(/usr/texbin $path)

# Add Haskell
path=(~/.cabal/bin $path)

# Add Node
# path=(~/node_modules/.bin $path)

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
source /usr/local/bin/virtualenvwrapper.sh

export VISUAL=vim
export EDITOR=vim

export PATH

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add;
     /usr/bin/ssh-add ~/.ssh/qa.pem;
     /usr/bin/ssh-add ~/.ssh/production.pem;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi
