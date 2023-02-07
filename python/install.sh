# want to be sure it's aliased when installing
pyenv install -s 3.11.1
pyenv global 3.11.1

base_python_packages="gnureadline ipython args PyQt6 psutil requests pipx autopep8 flake8 pep8 pylint pipenv"

if test "$(uname -s)" = "Darwin"; then
  pip install --upgrade pip
  pip install --upgrade $base_python_packages
else
  pip install --user --upgrade pip
  pip install --user --upgrade $base_python_packages
fi
