export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# Autoenv files
export AUTOENV_FILE_ENTER=".env.zsh"
export AUTOENV_FILE_LEAVE=".out.zsh"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# # Spaceship Theme configuration
# # this is required for spaceship theme
# export ZSH_CUSTOM="${HOME}/.zsh_custom"
# export SPACESHIP_PROMPT_SEPARATE_LINE=false
# # No pyenv
# export SPACESHIP_PYENV_SHOW=false
# export SPACESHIP_BATTERY_SHOW=false
# # USER
# SPACESHIP_USER_PREFIX="" # remove `with` before username
# SPACESHIP_USER_SUFFIX="" # remove space before host

# # HOST
# # Result will look like this:
# #   username@:(hostname)
# SPACESHIP_HOST_PREFIX="@:("
# SPACESHIP_HOST_SUFFIX=") "

# # DIR
# SPACESHIP_DIR_PREFIX='' # disable directory prefix, cause it's not the first section
# SPACESHIP_DIR_TRUNC='1' # show only last directory

# # GIT
# # Disable git symbol
# SPACESHIP_GIT_SYMBOL="" # disable git prefix
# SPACESHIP_GIT_BRANCH_PREFIX="" # disable branch prefix too
# # Wrap git in `git:(...)`
# SPACESHIP_GIT_PREFIX='git:('
# SPACESHIP_GIT_SUFFIX=") "
# SPACESHIP_GIT_BRANCH_SUFFIX="" # remove space after branch name
# # Unwrap git status from `[...]`
# SPACESHIP_GIT_STATUS_PREFIX=""
# SPACESHIP_GIT_STATUS_SUFFIX=""

# # HG
# # Disable HG symbol
# SPACESHIP_HG_SYMBOL=""
# SPACESHIP_HG_BRANCH_PREFIX="" # disable branch prefix too
# # Wrap git in `git:(...)`
# SPACESHIP_HG_PREFIX='hg:('
# SPACESHIP_HG_SUFFIX=") "
# SPACESHIP_HG_BRANCH_SUFFIX="" # remove space after branch name
# # Unwrap hg status from `[...]`
# SPACESHIP_HG_STATUS_PREFIX=""
# SPACESHIP_HG_STATUS_SUFFIX=""
# SPACESHIP_HG_STATUS_COLOR="yellow"

# # NODE
# SPACESHIP_NODE_PREFIX="node:("
# SPACESHIP_NODE_SUFFIX=") "
# SPACESHIP_NODE_SYMBOL=""

# # RUBY
# SPACESHIP_RUBY_PREFIX="ruby:("
# SPACESHIP_RUBY_SUFFIX=") "
# SPACESHIP_RUBY_SYMBOL=""

# # XCODE
# SPACESHIP_XCODE_PREFIX="xcode:("
# SPACESHIP_XCODE_SUFFIX=") "
# SPACESHIP_XCODE_SYMBOL=""

# # SWIFT
# SPACESHIP_SWIFT_PREFIX="swift:("
# SPACESHIP_SWIFT_SUFFIX=") "
# SPACESHIP_SWIFT_SYMBOL=""

# # GOLANG
# SPACESHIP_GOLANG_PREFIX="go:("
# SPACESHIP_GOLANG_SUFFIX=") "
# SPACESHIP_GOLANG_SYMBOL=""

# # DOCKER
# SPACESHIP_DOCKER_PREFIX="docker:("
# SPACESHIP_DOCKER_SUFFIX=") "
# SPACESHIP_DOCKER_SYMBOL=""

# # VENV
# SPACESHIP_VENV_PREFIX="venv:("
# SPACESHIP_VENV_SUFFIX=") "

# zstyle ':vcs_info:*' enable git hg # You can add hg too if needed: `git hg`

zstyle ':prezto:module:prompt' theme 'nicoulaj'

zstyle ":prezto:module:editor" key-bindings "emacs"
zstyle ":prezto:module:editor" dot-expansion "yes"
zstyle ":prezto:module:terminal" auto-title "yes"
zstyle ":prezto:module:syntax-highlighting" highlighters \
    "main" \
    "brackets" \
    "pattern" \
    "root"

zstyle ":prezto:*:*" case-sensitive "yes"
zstyle ":prezto:*:*" color "yes"

# zplug "sorin-ionescu/prezto", \
#   as:plugin, \
#   use:init.zsh, \
#   hook-build:"ln -s $ZPLUG_ROOT/repos/sorin-ionescu/prezto ${ZDOTDIR:-$HOME}/.zprezto"


zplug "modules/prompt", from:prezto
# zplug "modules/haskell", from:prezto
zplug "modules/node", from:prezto
# zplug "modules/ruby", from:prezto
zplug "modules/tmux", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/history", from:prezto
zplug "modules/editor", from:prezto
zplug "modules/utility", from:prezto
zplug "modules/completion", from:prezto
zplug "modules/osx", from:prezto
zplug "modules/git", from:prezto
zplug "modules/terminal", from:prezto
zplug "modules/homebrew", from:prezto
zplug "modules/python", from:prezto
# zplug "modules/command-not-found", from:prezto
zplug "modules/syntax-highlighting", from:prezto
zplug "modules/history-substring-search", from:prezto

zplug "Tarrasch/zsh-autoenv", from:github
zplug "zsh-users/zsh-completions", from:github

# zsh-async is required for pure
# zplug "mafredri/zsh-async", from:github
# zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# Theme
# zplug "denysdovhan/spaceship-zsh-theme", use:spaceship.zsh, from:github, at:3.0, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

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
  # export FZF_DEFAULT_OPTS=''
fi
  # --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
  # --color info:108,prompt:109,spinner:108,pointer:168,marker:168

