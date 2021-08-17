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
brew tap neovim/neovim

brew install --cask qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize suspicious-package quicklookase qlvideo webpquicklook marta db-browser-for-sqlite osxfuse
brew install zsh tmux grc grep coreutils tree fzf ack ctags fzy htop-osx curl wget cmake boost thefuck neovim vim python ruby reattach-to-user-namespace restic rclone rsync ext4fuse libuv unibilium the_silver_searcher pyenv

# for catalina
xattr -d -r com.apple.quarantine ~/Library/QuickLook

exit 0
