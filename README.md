# joshuakarjala does dotfiles

My shell, editor, tmux and tooling setup for **macOS** and **Ubuntu**. Everything is organised by topic
(zsh, git, tmux, vim, python, node, ...), so each area lives in its own folder.

Forked from [Zach Holman's dotfiles](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/), which
grew out of [Ryan Bates' dotfiles](http://github.com/ryanb/dotfiles).

## install

```sh
git clone https://github.com/joshuakarjala/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap   # links the dotfiles, sets up git, installs zsh (and Homebrew on a Mac)
script/install     # installs packages and tools
```

`script/bootstrap` asks for your git name and email, symlinks every `*.symlink` file into `$HOME`, and on a Mac
applies my macOS preferences (`osx/set-defaults.sh`, which restarts Finder and the Dock).
`script/install` runs the platform installer (`homebrew/install.sh` on macOS, `apt-get/install.sh` on Ubuntu)
and then every topic's `install.sh` (docker, node, prezto, python, tmux, vim). It reports any installer that fails.

When it's done:

- add your ssh key (`ssh-add ~/.ssh/<keyname>`)
- change your shell to zsh (`chsh -s "$(command -v zsh)"`)
- on macOS, run `set-defaults` any time to re-apply the macOS preferences

## updating

Run `dot` now and then. It updates Homebrew (macOS) or apt and snap (Ubuntu), then your vim plugins.
`dot-install` re-runs the full install.

## how it's organised

- **topic/\*.symlink**: symlinked into `$HOME` without the extension by `script/bootstrap`
  (`zsh/zshrc.symlink` becomes `~/.zshrc`).
- **topic/\*.zsh**: loaded into every shell. `path.zsh` files load first and `completion.zsh` files last.
- **topic/install.sh**: run by `script/install`.
- **bin/**: put on your `$PATH`.
- **functions/**: zsh functions (`c` jumps to a project, `tks` kills a tmux session).

Machine-specific settings and secrets go in `~/.localrc`, which is sourced but never committed. The generated
`git/gitconfig.symlink` is git-ignored too.

## tools in `bin/`

- `dot`, `dot-install`: update and install (above).
- `clip`: copy stdin to the clipboard with `pbcopy`, `wl-copy`, `xclip`, or an OSC 52 escape sequence when none
  exist, so it works over ssh.
- `e`: open a file or directory in `$EDITOR` (falls back to vim).
- `search`: `ack -i` wrapper.
- `git-*`: small git helpers (`git up`, `git undo`, `git wtf`, `git nuke`, ...).

## tmux

- The prefix is the backtick, `` ` ``. `` ` r `` reloads the config and `` ` C-r `` refreshes the environment
  (such as `SSH_AUTH_SOCK`) in running shells.
- New windows are named after their folder. `` ` , `` renames one by hand, `` ` & `` closes a window.
- Clipboard copy uses OSC 52, so copies on a server end up in your local clipboard. In iTerm2, enable
  *Settings → General → Selection → Applications in terminal may access clipboard*.
- When you ssh into a machine, `tmux/tmux.remote.conf` is loaded automatically (status bar at the top).
  Press `F12` to hand all keys to the inner session when tmux is nested, and `F12` again to take them back.
- Plugins are managed by [tpm](https://github.com/tmux-plugins/tpm): `` ` I `` installs and `` ` alt-u `` removes
  plugins no longer in the config.

## bugs

I want this to work for everyone, but it's my own setup, so things may break if I forget to check for a
dependency. If you hit a blocker, please
[open an issue](https://github.com/joshuakarjala/dotfiles/issues).
