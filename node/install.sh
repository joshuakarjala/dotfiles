export NVM_DIR="$HOME/.config/nvm"
NVM_VERSION="v0.40.3"

if [ ! -s "$NVM_DIR/nvm.sh" ]; then
  mkdir -p "$NVM_DIR"
  # PROFILE=/dev/null stops the installer appending to ~/.zshrc (which is a symlink into this repo)
  curl -fsSL "https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION/install.sh" | PROFILE=/dev/null bash
fi

# nvm is a shell function, so it has to be loaded into this shell before use
\. "$NVM_DIR/nvm.sh" || exit 1

nvm install --lts
nvm alias default 'lts/*'
nvm cache clear

npm_default_packages="yarn typescript eslint"

npm install -g $npm_default_packages
