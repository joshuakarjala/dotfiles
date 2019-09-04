# want to be sure it's aliased when installing
alias python=python3
alias pip=pip3

base_python_packages="pipenv gnureadline ipython args PyQt5 psutil requests pep8 flake8 neovim nose autopep8 pylint"

if test "$(uname -s)" = "Darwin"; then
  pip install --upgrade pip
  pip install --upgrade $base_python_packages
else
  pip install --user --upgrade pip
  pip install --user --upgrade $base_python_packages
fi
