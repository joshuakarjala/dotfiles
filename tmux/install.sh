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

## setup remote pbcopy

mkdir -p ~/.tmux

if test "$(uname)" = "Darwin"; then
  if [ ! -f ~/Library/LaunchAgents/pbcopy.plist ]; then
    ln -s ~/.dotfiles/tmux/pbcopy.plist ~/Library/LaunchAgents/pbcopy.plist
  fi
fi

if [ ! -f ~/.tmux/tmux.remote.conf ]; then
  ln -s ~/.dotfiles/tmux/tmux.remote.conf ~/.tmux/tmux.remote.conf
fi

if [ ! -f ~/.tmux/yank.sh ]; then
  ln -s ~/.dotfiles/tmux/yank.sh ~/.tmux/yank.sh
fi

if [ ! -f ~/.tmux/renew_env.sh ]; then
  ln -s ~/.dotfiles/tmux/renew_env.sh ~/.tmux/renew_env.sh
fi
