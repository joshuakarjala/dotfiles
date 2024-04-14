if test ! $(command -v pyenv);
then
  if test "$(uname -s)" = "Linux";
  then
    curl https://pyenv.run | bash
  else
    brew install pyenv
  fi
fi

# want to be sure it's aliased when installing
pyenv install 3.12 -s
pyenv global 3.12

base_python_packages="gnureadline ipython args psutil requests pipx autopep8 flake8 pep8 pylint"

if test "$(uname -s)" = "Darwin"; then
  pip install --upgrade pip
  pip install --upgrade $base_python_packages
else
  pip install --user --upgrade pip
  pip install --user --upgrade $base_python_packages
fi

if test ! $(command -v poetry);
then
  pipx install poetry
fi
