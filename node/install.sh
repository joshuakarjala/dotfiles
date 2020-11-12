export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

if test ! $(command -v nvm); then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash
fi

nvm install --lts
nvm cache clear

if test ! $(which yarn); then
  curl -o- -L https://yarnpkg.com/install.sh | bash
fi

npm_default_packages="airpaste http-server typescript eslint"

yarn global add $npm_default_packages
