if test "$(uname -s)" != "Darwin"; then
  sudo apt-get remove docker docker-engine docker.io containerd runc
  sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo apt-key fingerprint 0EBFCD88
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  sudo apt-get update
  sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose
  # add user to docker group
  sudo usermod -a -G docker $USER
else
  brew install --cask docker
fi
