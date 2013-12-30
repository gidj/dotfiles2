#!/bin/bash
# Simple setup.sh for symlinking configuration files to a new machine.

cd $HOME
if [ -e ./.vimrc ]; then
    mv .vimrc .vimrc~
fi
if [ -d ./.vim/ ]; then 
    mv .vim .vim.old
fi
if [ -e ./.tmux.conf ]; then
    mv .tmux.conf .tmux.conf~
fi
if [ -e ./.zshrc ]; then
    mv .zshrc .zshrc~
fi
if [ -e ./.zprofile ]; then
    mv .zprofile .zprofile~
fi

# Create symlinks to various configuration folders and files.
ln -s dotfiles/vim .vim
ln -s .vim/vimrc .vimrc
ln -s dotfiles/tmux.conf .tmux.conf
ln -s dotfiles/zshrc .zshrc
ln -s dotfiles/zprofile .zprofile

