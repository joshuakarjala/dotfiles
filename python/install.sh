export PYENV_ROOT="${PYENV_ROOT:-$HOME/.pyenv}"
export PATH="$PYENV_ROOT/bin:$PATH"

if test ! "$(command -v pyenv)";
then
  if test "$(uname -s)" = "Linux";
  then
    curl https://pyenv.run | bash
  else
    brew install pyenv
  fi
fi

# want to be sure it's aliased when installing
export PATH="$PYENV_ROOT/shims:$PATH"

pyenv install 3.14 -s || exit 1
pyenv global 3.14

base_python_packages="gnureadline ipython args psutil requests pipx autopep8 flake8 pep8 pylint"

# go through the pyenv python so system pip (externally managed on newer Ubuntu/Homebrew) is never used
python -m pip install --upgrade pip
python -m pip install --upgrade $base_python_packages

# if test ! $(command -v poetry);
# then
#   pipx install poetry
# fi
