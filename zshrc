# load zgen
export ZGEN_RESET_ON_CHANGE=($HOME/.zshrc)
source "${HOME}/dotfiles/zgen/zgen.zsh"

# Autoenv files
export AUTOENV_FILE_ENTER=".env"
export AUTOENV_FILE_LEAVE=".out"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    # prezto options
    zgen prezto editor key-bindings 'emacs'
    zgen prezto editor dot-expansion 'yes'
    zgen prezto prompt theme 'giddie'
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

    # save all to init script
    zgen save
fi
