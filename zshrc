# load zgen
export ZGEN_RESET_ON_CHANGE=($HOME/.zshrc)
source "${HOME}/dotfiles/zgen/zgen.zsh"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    # prezto options
    zgen prezto editor key-bindings 'emacs'
    zgen prezto editor dot-expansion 'yes'
    zgen prezto prompt theme 'giddie'
    # zgen prezto tmux:auto-start local 'yes'
    zgen prezto '*:*' case-sensitive 'yes'
    zgen prezto '*:*' color 'yes'

    # prezto and modules
    zgen prezto
    zgen prezto git
    zgen prezto homebrew
    zgen prezto osx
    zgen prezto python
    zgen prezto ruby
    zgen prezto command-not-found
    zgen prezto tmux
    zgen prezto haskell
    zgen prezto history-substring-search
    zgen prezto syntax-highlighting

    # completions
    # zgen load zsh-users/zsh-completions src
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load tarruda/zsh-autosuggestions

    # save all to init script
    zgen save
fi
