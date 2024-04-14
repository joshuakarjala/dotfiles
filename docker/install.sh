if test ! $(command -v docker);
then
  if test "$(uname -s)" != "Darwin";  then
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    rm get-doocker.sh
  else
    brew install --cask docker
  fi
fi
