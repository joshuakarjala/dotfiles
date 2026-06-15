#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

if test ! "$(uname)" = "Darwin"; then
  exit 0
fi

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install homebrew packages

brew install --cask suspicious-package qlvideo marta db-browser-for-sqlite ngrok
brew install zsh tmux grc grep coreutils tree fzf ack ctags fzy htop-osx curl wget cmake boost thefuck neovim vim reattach-to-user-namespace restic rclone rsync libuv unibilium the_silver_searcher gnupg pyenv sshpass

# for catalina
xattr -d -r com.apple.quarantine ~/Library/QuickLook

exit 0
