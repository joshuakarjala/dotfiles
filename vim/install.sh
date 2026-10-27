#!/bin/sh
export XDG_CONFIG_HOME=$HOME/.config

if [ ! -f $XDG_CONFIG_HOME/nvim/init.vim ]; then
  ln -s ~/.vim $XDG_CONFIG_HOME/nvim
  ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
fi

# vimrc keeps backup/swap/undo files here; create it private so they don't fall back to world-readable /tmp
mkdir -p ~/.vim-tmp
chmod 700 ~/.vim-tmp
