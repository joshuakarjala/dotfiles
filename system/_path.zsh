export PATH="/bin:/usr/local/bin:/usr/local/sbin:$ZSH/bin:$PATH"
export MANPATH="/usr/local/man:/usr/local/git/man:$MANPATH"

if test "$(uname -s)" != "Darwin"; then
  export PATH="/home/joshua/.gem/ruby/2.5.0/bin:$PATH"
  export PATH="/home/joshua/.local/bin/:$PATH"
else
  export PATH="/usr/local/opt/ruby/bin:$PATH"
fi

