typeset -U path

# Add Python3
path=(/usr/local/opt/python/libexec/bin $path)

# Add Node
path=(~/node_modules/.bin $path)

# Add Homebrew sbin
path=(/usr/local/sbin $path)

# Add ~/bin
path=(~/bin $path)

export PATH

export WORKON_HOME=$HOME/.venvs
export PROJECT_HOME=$HOME/Projects

export VISUAL=nvim
export EDITOR=nvim

export TERM=tmux-256color
export SSH_ENV="$HOME/.ssh/environment"

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
alias vi="nvim"
alias vim="nvim"

# Eclimd
alias eclimd='/Applications/Eclipse.app/Contents/Eclipse/eclimd'

# Node
alias nlg="npm list -g --depth=0 2>/dev/null"
alias nll="npm list --depth=0 2>/dev/null"

# Be sure to always send a TERM that the other machines can understand
alias ssh='TERM=screen-256color ssh'
alias vagrant='TERM=screen-256color vagrant'

# Work aliases
alias vivid="~/vividseats"

# Terraform
function terraform_do() {
    terraform "$1" -var "do_token=${DO_TOKEN}" \
-var "pub_key=$HOME/.ssh/id_ed25519.pub" \
-var "pvt_key=$HOME/.ssh/id_ed25519" \
-var "ssh_fingerprint=dc:d3:31:d2:84:7c:55:b9:94:8d:dd:57:07:b0:18:c8"
}
