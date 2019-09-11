if test ! $(which nave); then
  if test "$(uname)" = "Darwin"; then
    brew install nave
  else
    sudo apt-get install -y npm
    sudo npm install -g nave
  fi
fi

if test ! $(which yarn); then
  if test "$(uname)" = "Darwin"; then
    brew install yarn --ignore-dependencies
  else
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt-get update
    sudo apt-get install -y --no-install-recommends yarn
  fi
fi

# update version here when needed
nave install latest

if test "$(uname)" = "Darwin"; then
  nave usemain latest
else
  sudo nave usemain latest
fi

nave cache clear

npm_default_packages="nodemon airpaste semistandard create-project snazzy standard-format http-server serverless typescript eslint eslint-config-standard eslint-plugin-import eslint-plugin-node eslint-plugin-standard eslint-plugin-promise"

### Specific settings for OSX
###
if test "$(uname)" = "Darwin"; then
  npm_default_packages="$npm_default_osx_packages peerflix"
fi
###
### END specific for OSX

yarn global add $npm_default_packages
