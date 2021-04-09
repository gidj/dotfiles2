ZSH_DISABLE_COMPFIX="true"

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

zstyle ":prezto:module:editor" key-bindings "emacs"
zstyle ":prezto:module:editor" dot-expansion "yes"
zstyle ":prezto:*:*" color "yes"

zinit snippet PZT::modules/environment/init.zsh
zinit snippet PZT::modules/tmux/init.zsh
zinit snippet PZT::modules/directory/init.zsh
zinit snippet PZT::modules/history/init.zsh
zinit snippet PZT::modules/homebrew/init.zsh
zinit snippet PZT::modules/editor/init.zsh
zinit snippet PZT::modules/utility/init.zsh
zinit snippet PZT::modules/completion/init.zsh
zinit snippet PZT::modules/osx/init.zsh
zinit snippet PZT::modules/terminal/init.zsh
zinit snippet PZT::modules/ssh/init.zsh

setopt promptsubst

zinit wait lucid for \
        OMZL::git.zsh \
  atload"unalias grv" \
        OMZP::git

# direnv
zinit from"gh-r" as"program" mv"direnv* -> direnv" \
    atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
    pick"direnv" src="zhook.zsh" for \
        direnv/direnv

zinit ice as"completion"
zinit snippet PZT::modules/docker

zinit ice wait'0' lucid
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

zinit ice wait'0' atinit"zpcompinit" lucid
zinit light zdharma/fast-syntax-highlighting

# zsh-async is required for pure
zinit light mafredri/zsh-async
zinit light sindresorhus/pure

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/dotfiles/functions.zsh ] && source ~/dotfiles/functions.zsh

# Returns whether the given command is executable or aliased.
_has() {
  return $( whence $1 >/dev/null )
}


if _has fzf + _has fd; then
    export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
    export FZF_DEFAULT_COMMAND='fd --type f'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
    export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
fi


# # fzf + ag configuration
# if _has fzf && _has rg; then
#   export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
#   export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
#   # export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
#   export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#   export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
#   export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
# fi

autoload -U +X bashcompinit && bashcompinit

# poetry completions
fpath+=~/.zfunc
# Amazon completion
fpath+=~/.zsh/completion

autoload -Uz compinit
compinit

