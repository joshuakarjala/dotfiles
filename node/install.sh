if test ! $(which nave)
then
  brew install nave
fi

if test ! $(which yarn)
then
  brew install yarn --without-node
fi

# update version here when needed
nave install lts
nave install latest

nave usemain lts

npm_default_packages="nodemon airpaste semistandard create-project snazzy standard-format http-server serverless peerflix dat"

yarn global add $npm_default_packages
