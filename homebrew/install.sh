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
brew install zsh tmux grc grep emacs coreutils tree ack ctags fzy htop-osx curl wget cmake boost the_silver_searcher thefuck gpg2 gpg libpq imagemagick ghostscript git-flow autoenv httpie siege wrk libuv unibilium libtermkey libvterm vim neovim python ruby heroku shfmt reattach-to-user-namespace doctl kubernetes-cli

brew cask install alacritty webpquicklook quicklook-json qlstephen qlmarkdown qlcolorcode qlprettypatch quicklook-csv

exit 0
