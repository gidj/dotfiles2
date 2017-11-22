# load zgen
export ZGEN_RESET_ON_CHANGE=($HOME/.zshrc)
source "${HOME}/dotfiles/zgen/zgen.zsh"

# Autoenv files
export AUTOENV_FILE_ENTER=".env.zsh"
export AUTOENV_FILE_LEAVE=".out.zsh"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# this is required for spaceship theme
export ZSH_CUSTOM="${HOME}/.zsh_custom"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    # prezto options
    zgen prezto editor key-bindings 'emacs'
    zgen prezto editor dot-expansion 'yes'
    zgen prezto prompt theme 'nicoulaj'
    # zgen prezto prompt theme 'sorin'
    zgen prezto 'syntax-highlighting' highlighters \
        'main' \
        'brackets' \
        'pattern' \
        'root'
    # zgen prezto tmux:auto-start local 'yes'
    zgen prezto tmux:auto-start remote 'yes'
    zgen prezto '*:*' case-sensitive 'yes'
    zgen prezto '*:*' color 'yes'

    # prezto and modules
    zgen prezto
    zgen prezto git
    zgen prezto haskell
    zgen prezto homebrew
    zgen prezto node
    zgen prezto osx
    zgen prezto python
    zgen prezto ruby
    zgen prezto tmux
    zgen prezto command-not-found
    zgen prezto syntax-highlighting
    zgen prezto history-substring-search

    # Autoenv
    zgen load Tarrasch/zsh-autoenv

    # External Plugins
    zgen load zsh-users/zsh-completions src
    # zgen load tarruda/zsh-autosuggestions

    # Theme
    # zgen load denysdovhan/spaceship-zsh-theme spaceship

    # save all to init script
    zgen save
fi

ZSH_THEME="spaceship"

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

# Be sure to always send a TERM that the other machine can understand
alias ssh='TERM=screen-256color ssh'
alias vagrant='TERM=screen-256color vagrant'

alias django-paths='python -c "
import sys
sys.path = sys.path[1:]
import django
print(django.__path__)"'

# Work aliases
alias aya="/Volumes/Development/cloverwireless/aya"

# Project aliases
alias rackr="~/Projects/rackr"

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

# Eclimd
alias eclimd='/Applications/Eclipse.app/Contents/Eclipse/eclimd'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Returns whether the given command is executable or aliased.
_has() {
  return $( whence $1 >/dev/null )
}

# fzf + ag configuration
if _has fzf && _has ag; then
  export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS='
  '
fi
  # --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
  # --color info:108,prompt:109,spinner:108,pointer:168,marker:168

