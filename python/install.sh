# easy_install -U pip
# easy_install-3.5 -U pip

python_packages="gnureadline pipenv ipython args psutil fabric pillow boto nose requests SpoofMAC virtualenv virtualenvwrapper pep8 flake8 jinja2 bottle flask neovim"
scipy_packages="numpy pandas scipy matplotlib sympy nltk"

pip2 install --upgrade pip
pip3 install --upgrade pip

# usual stuff
pip2 install -U --user $python_packages
pip3 install -U --user $python_packages

# scipy stack
pip2 install -U --user $scipy_packages
pip3 install -U --user $scipy_packages
