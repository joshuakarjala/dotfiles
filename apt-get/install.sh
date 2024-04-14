#!/bin/sh
#
# apt-get
#
# This installs some of the common dependencies needed with apt-get

if test "$(uname)" = "Darwin"; then
  exit 0
fi

sudo apt-get update
sudo apt-get install -y zsh tmux grc shfmt grep emacs coreutils tree ack universal-ctags htop curl wget cmake libboost-all-dev libpq-dev thefuck gpg imagemagick ghostscript git-flow direnv httpie libuv1-dev  libunibilium-dev libtermkey-dev libvterm-dev vim neovim python3 ruby fzy python3-setuptools ruby-dev python3-pip build-essential xdg-utils bzip2 libncurses-dev libffi-dev libsqlite3-dev lzma fzf rbenv

