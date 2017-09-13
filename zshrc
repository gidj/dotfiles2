export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zstyle ":prezto:*:*" color "yes"
zstyle ":prezto:*:*" case-sensitive "yes"

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


# zplug "modules/prompt", from:prezto
# zplug "modules/haskell", from:prezto
# zplug "modules/node", from:prezto
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

zplug mafredri/zsh-async, from:github
zplug zsh-users/zsh-completions, from:github
zplug gidj/pure, use:pure.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
