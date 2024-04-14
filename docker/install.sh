if test "$(uname -s)" != "Darwin" && ! $(which docker);  then
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh
  rm get-doocker.sh
else
  brew install --cask docker
fi
