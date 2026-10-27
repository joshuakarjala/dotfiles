#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

if test ! "$(uname)" = "Darwin"; then
  exit 0
fi

load_brew () {
  for b in /opt/homebrew/bin/brew /usr/local/bin/brew; do
    if [ -x "$b" ]; then
      eval "$("$b" shellenv)"
      return 0
    fi
  done
  return 1
}

# Check for Homebrew
if ! command -v brew >/dev/null 2>&1 && ! load_brew; then
  echo "  Installing Homebrew for you."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || exit 1
  load_brew || exit 1
fi

# Install homebrew packages

brew install --cask suspicious-package qlvideo marta db-browser-for-sqlite ngrok
brew install zsh tmux grc grep coreutils tree fzf ack universal-ctags fzy htop curl wget cmake boost thefuck neovim vim restic rclone rsync libuv unibilium the_silver_searcher gnupg pyenv sshpass
