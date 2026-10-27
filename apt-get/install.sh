#!/bin/sh
#
# apt-get
#
# This installs some of the common dependencies needed with apt-get

if test "$(uname)" = "Darwin"; then
  exit 0
fi

sudo apt-get update

# core packages: these exist on every supported Debian and Ubuntu release
# noninteractive: no questions (e.g. the tzdata timezone prompt) so the installer can run unattended
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y git locales zsh tmux grc grep coreutils tree ack universal-ctags htop curl wget cmake gpg \
  vim neovim python3 python3-pip python3-setuptools ruby ruby-dev fzf silversearcher-ag \
  build-essential xdg-utils bzip2 xz-utils \
  libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libncurses-dev libffi-dev liblzma-dev tk-dev \
  libboost-all-dev libpq-dev libuv1-dev || exit 1

# optional packages: availability varies between Debian and Ubuntu releases, so don't let one missing package abort the rest
for pkg in shfmt emacs thefuck imagemagick ghostscript git-flow direnv httpie fzy rbenv libunibilium-dev libtermkey-dev libvterm-dev; do
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y "$pkg" || echo "  Skipping unavailable package: $pkg"
done

# generate the locale the shell config asks for. Debian only builds locales listed in
# /etc/locale.gen (passing a name to locale-gen is ignored there), so enable it first.
sudo sed -i 's/^# *\(en_US.UTF-8 UTF-8\)/\1/' /etc/locale.gen
sudo locale-gen
