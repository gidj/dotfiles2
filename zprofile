typeset -U path

# Add Python3
path=(/usr/local/opt/python/libexec/bin $path)

# Add Node
path=(~/node_modules/.bin $path)

export WORKON_HOME=$HOME/.venvs
export PROJECT_HOME=$HOME/Projects

export VISUAL=nvim
export EDITOR=nvim

export PATH

export TERM=tmux-256color
SSH_ENV="$HOME/.ssh/environment"

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

# Node
alias nlg="npm list -g --depth=0 2>/dev/null"
alias nll="npm list --depth=0 2>/dev/null"

# Be sure to always send a TERM that the other machines can understand
alias ssh='TERM=screen-256color ssh'
alias vagrant='TERM=screen-256color vagrant'

alias django-paths='python -c "
import sys
sys.path = sys.path[1:]
import django
print(django.__path__)"'

# Work aliases
alias aya="/Volumes/Development/cloverwireless/aya"

# Mercurial
alias hgc='hg commit'
alias hgb='hg branch'
alias hgba='hg branches'
alias hgbk='hg bookmarks'
alias hgco='hg checkout'
alias hgd='hg diff'
alias hged='hg diffmerge'
# pull and update
alias hgi='hg incoming'
alias hgl='hg pull -u'
alias hglr='hg pull --rebase'
alias hgo='hg outgoing'
alias hgp='hg push'
alias hgpl='hg log -v -p'
alias hgs='hg status'
alias hgsl='hg log --limit 20 --template "{node|short} | {date|isodatesec} | {author|user}: {desc|strip|firstline}\n" '
alias hgca='hg commit --amend'
# list unresolved files (since hg does not list unmerged files in the status command)
alias hgun='hg resolve --list'
# tags
alias hgth='hg tags |head'

# Eclimd
alias eclimd='/Applications/Eclipse.app/Contents/Eclipse/eclimd'

