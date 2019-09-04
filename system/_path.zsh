export PATH="/usr/local/bin:/usr/local/sbin:$ZSH/bin:$PATH"
export MANPATH="/usr/local/man:/usr/local/git/man:$MANPATH"

if test "$(uname -s)" != "Darwin"; then
  export PATH="~/.gem/ruby/2.5.0/bin:$PATH"
  export PATH="~/.local/bin/:$PATH"
fi

