# want to be sure it's aliased when installing
pyenv install -s 3.8.2
pyenv global 3.8.2

base_python_packages="gnureadline ipython args PyQt5 psutil requests pipx autopep8 flake8 pep8 nose pylint pipenv"

if test "$(uname -s)" = "Darwin"; then
  pip install --upgrade pip
  pip install --upgrade $base_python_packages
else
  pip install --user --upgrade pip
  pip install --user --upgrade $base_python_packages
fi
