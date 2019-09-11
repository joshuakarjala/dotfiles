#!/bin/sh
#
# apt-get
#
# This installs some of the common dependencies needed with apt-get

if test "$(uname)" = "Darwin"; then
  exit 0
fi

sudo apt-get update
sudo apt-get install -y zsh tmux grc grep emacs coreutils tree ack ctags htop curl wget cmake libboost-all-dev silversearcher-ag libpq-dev thefuck gpg imagemagick ghostscript git-flow direnv httpie libuv1-dev  libunibilium-dev libtermkey-dev libvterm-dev vim neovim python3 ruby fzy python3-setuptools python-setuptools ruby-dev python3-pip python-pip build-essential xdg-utils

sudo snap install shfmt
sudo snap install --classic heroku
sudo snap install doctl
sudo snap install kubectl --classic
sudo snap connect doctl:kube-config
