#!/bin/sh
export TMUX_PLUGIN=$HOME/.tmux/plugins/tpm

if [ ! -d $TMUX_PLUGIN ]; then
  mkdir -p $HOME/.tmux/plugins
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  printf 'Already installed TMUX plugins!\nUpgrading ..\n\n'
  cd $TMUX_PLUGIN
  git pull
  cd $HOME
fi

$HOME/.tmux/plugins/tpm/bin/install_plugins
$HOME/.tmux/plugins/tpm/bin/update_plugins all
$HOME/.tmux/plugins/tpm/bin/clean_plugins

## link config helpers (clipboard goes over OSC 52, no pbcopy tunnel needed)

mkdir -p ~/.tmux

ln -sfn ~/.dotfiles/tmux/tmux.remote.conf ~/.tmux/tmux.remote.conf
ln -sfn ~/.dotfiles/tmux/renew_env.sh ~/.tmux/renew_env.sh
