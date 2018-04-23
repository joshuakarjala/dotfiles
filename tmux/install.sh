#!/bin/sh
export TMUX_PLUGIN=$HOME/.tmux/plugins/tpm

if [ ! -d $TMUX_PLUGIN ]; then
  mkdir -p $HOME/.tmux/plugins
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo 'Already installed TMUX plugins!\nUpgrading ..\n'
  cd $TMUX_PLUGIN
  git pull
  cd $HOME
fi

$HOME/.tmux/plugins/tpm/bin/install_plugins
$HOME/.tmux/plugins/tpm/bin/update_plugins all
$HOME/.tmux/plugins/tpm/bin/clean_plugins
