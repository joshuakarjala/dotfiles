# Homebrew (Apple Silicon, Intel and Linuxbrew prefixes)
for brew_bin in /opt/homebrew/bin/brew /usr/local/bin/brew /home/linuxbrew/.linuxbrew/bin/brew; do
  if [ -x "$brew_bin" ]; then
    eval "$("$brew_bin" shellenv)"
    break
  fi
done
unset brew_bin

export PATH="/usr/local/bin:/usr/local/sbin:$ZSH/bin:$PATH"
export MANPATH="/usr/local/man:/usr/local/git/man:$MANPATH"

if test "$(uname -s)" != "Darwin"; then
  for gem_bin in $HOME/.gem/ruby/*/bin(N); do
    export PATH="$gem_bin:$PATH"
  done
  unset gem_bin
elif [ -n "$HOMEBREW_PREFIX" ] && [ -d "$HOMEBREW_PREFIX/opt/ruby/bin" ]; then
  export PATH="$HOMEBREW_PREFIX/opt/ruby/bin:$PATH"
fi

export PATH="$HOME/.local/bin:$PATH"
