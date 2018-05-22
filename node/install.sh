if test ! $(which nave)
then
  brew install nave
fi

if test ! $(which yarn)
then
  brew install yarn --ignore-dependencies
fi

# update version here when needed
nave install lts
nave install latest

nave usemain lts

npm_default_packages="nodemon airpaste semistandard create-project snazzy standard-format http-server serverless peerflix dat typescript eslint eslint-config-standard eslint-plugin-import eslint-plugin-node eslint-plugin-standard eslint-plugin-promise"

yarn global add $npm_default_packages
