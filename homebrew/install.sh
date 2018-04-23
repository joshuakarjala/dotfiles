#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install homebrew packages
brew tap neovim/neovim
brew install tmux grc coreutils tree ack ctags selecta htop-osx curl wget cmake boost the_silver_searcher thefuck fpp gpg2 gpg postgres imagemagick ghostscript git-flow autoenv httpie siege wrk libuv unibilium libtermkey libvterm vim neovim python python2 ruby heroku shfmt

brew cask install webpquicklook quicklook-json qlstephen qlmarkdown qlcolorcode qlprettypatch quicklook-csv easysimbl

exit 0
