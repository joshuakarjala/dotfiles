#!/bin/sh

export ZSH="${ZSH:-$HOME/.dotfiles}"
export PREZTO_HOME=$HOME/.zprezto

if [ ! -d "$PREZTO_HOME" ]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "$PREZTO_HOME" || exit 1
else
  printf 'Already installed Prezto!\nUpgrading Prezto ..\n\n'
  cd "$PREZTO_HOME" || exit 1
  git pull && git submodule update --init --recursive
fi

cd "$ZSH/prezto/themes" || exit 1

for f in * ; do
  if [ ! -f "$PREZTO_HOME/modules/prompt/functions/$f" ]; then
    ln -s "$ZSH/prezto/themes/$f" "$PREZTO_HOME/modules/prompt/functions"
    echo "Linking custom theme: $f"
  else
    echo "Custom theme already exists: $f"
  fi
done

cd "$HOME"
