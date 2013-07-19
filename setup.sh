#!/bin/bash
# Simple setup.sh for symlinking configuration files to a new machine.

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

# Create symlinks to various configuration folders and files.
ln -s devops/vim .vim
ln -s .vim/vimrc .vimrc
ln -s devops/tmux.conf .tmux.conf

