export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

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

# zplug "modules/node", from:prezto
zplug "modules/tmux", from:prezto
zplug "modules/docker", from:prezto
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
zplug "modules/syntax-highlighting", from:prezto
zplug "modules/history-substring-search", from:prezto

zplug "zsh-users/zsh-completions", from:github

# zsh-async is required for pure
zplug "mafredri/zsh-async", from:github
zplug "mnpenner/pure", use:pure.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

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

# pipenv completion
eval "$(pipenv --completion)"

# Activate direnv
eval "$(direnv hook zsh)"
