#!/bin/sh
#
# apt-get
#
# This installs some of the common dependencies needed with apt-get

if test "$(uname)" = "Darwin"; then
  exit 0
fi

sudo apt-get update

# core packages: these exist on every supported Ubuntu release
sudo apt-get install -y git locales zsh tmux grc grep coreutils tree ack universal-ctags htop curl wget cmake gpg \
  vim neovim python3 python3-pip python3-setuptools ruby ruby-dev fzf silversearcher-ag \
  build-essential xdg-utils bzip2 xz-utils \
  libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libncurses-dev libffi-dev liblzma-dev tk-dev \
  libboost-all-dev libpq-dev libuv1-dev || exit 1

# optional packages: availability varies between Ubuntu releases, so don't let one missing package abort the rest
for pkg in shfmt emacs thefuck imagemagick ghostscript git-flow direnv httpie fzy rbenv libunibilium-dev libtermkey-dev libvterm-dev; do
  sudo apt-get install -y "$pkg" || echo "  Skipping unavailable package: $pkg"
done

# generate the locale the shell config asks for
sudo locale-gen en_US.UTF-8
