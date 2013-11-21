#!/bin/bash
# Simple setup.sh for symlinking configuration files to a new machine.

DIR="dotfiles"

cd $HOME
if [ -e ./.vimrc ]; then
    mv .vimrc .vimrc~
fi
if [ -e ./.tmux.conf ]; then
    mv .tmux.conf .tmux.conf~
fi
if [ -d ./.vim/ ]; then 
    mv .vim .vim.old
fi
if [ -d ./.zshrc ]; then 
    mv .zshrc .zshrc~
fi

# Create symlinks to various configuration folders and files.
ln -s $DIR/vim .vim
ln -s .vim/vimrc .vimrc
ln -s $DIR/tmux.conf .tmux.conf
ln -s $DIR/zshrc .zshrc
