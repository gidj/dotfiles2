### Added by Zplugin's installer
source '/Users/gideon.vanriette/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk
#

# export ZPLUG_HOME=/usr/local/opt/zplug
# source $ZPLUG_HOME/init.zsh

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

zplugin snippet PZT::modules/node/init.zsh
zplugin snippet PZT::modules/tmux/init.zsh
# zplug "modules/docker", from:prezto
zplugin snippet PZT::modules/directory/init.zsh
zplugin snippet PZT::modules/history/init.zsh
zplugin snippet PZT::modules/editor/init.zsh
zplugin snippet PZT::modules/utility/init.zsh
zplugin snippet PZT::modules/completion/init.zsh
zplugin snippet PZT::modules/osx/init.zsh
# zplugin snippet PZT::modules/git/init.zsh
zplugin snippet PZT::modules/terminal/init.zsh
zplugin snippet PZT::modules/homebrew/init.zsh
zplugin snippet PZT::modules/python/init.zsh
# zplugin snippet PZT::modules/history-substring-search/init.zsh
# zplugin snippet PZT::modules/syntax-highlighting/init.zsh

# zsh-async is required for pure
zplugin light mafredri/zsh-async
zplugin light sindresorhus/pure






[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Returns whether the given command is executable or aliased.
_has() {
  return $( whence $1 >/dev/null )
}

# pipenv completion
eval "$(pipenv --completion)"

# fzf + ag configuration
if _has fzf && _has ag; then
  export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# Activate direnv
eval "$(direnv hook zsh)"

source ~/.zsecrets

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

# export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion
