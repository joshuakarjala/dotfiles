# Dotfiles: working notes

Condensed context for future sessions (human or Claude). Owner: Joshua. Repo: `~/.dotfiles`,
github.com/joshuakarjala/dotfiles, branch `master`. Public repo: no secrets, put local ones in `~/.localrc`.

## Where it runs
- **Mac** (macOS 26, Apple Silicon, Homebrew in `/opt/homebrew`), terminal is **iTerm2**.
- **Server** `madrid-server`: **Debian 12**, tmux 3.3a, Neovim 0.7.2, no snap, reached over Tailscale.
- **Ubuntu 24.04** is supported and tested in a container only.
- Everything has to work on all three: use `uname`/`command -v` checks, never hardcode `/Users/joshua`.

## How it is organised
- `topic/*.symlink` -> `~/.<name>` (via `script/bootstrap`); `topic/*.zsh` is sourced by `zsh/zshrc.symlink`
  (files under `vim/.../plugged` are skipped); `topic/install.sh` is run by `script/install`; `bin/` is on `$PATH`.
- Flow: `script/bootstrap` (links, git identity, zsh, Homebrew on a Mac, applies `osx/set-defaults.sh`)
  then `script/install` (platform installer, then each topic `install.sh` in sorted order, reports failures).
  `dot` updates later (brew or apt, then Vim plugins via headless Neovim); `dot-install` re-runs the install.
- `script/docker-test/run.sh` is the clean Debian 12 / Ubuntu 24.04 container test (see Testing).

## Decisions and the reasons behind them
- **Clipboard = OSC 52**, no pbcopy/nc tunnel. tmux `set-clipboard on`; iTerm2 needs *Applications in terminal
  may access clipboard*. `bin/clip` picks pbcopy / wl-copy / xclip / OSC 52. `vimrc` has a hand-written OSC 52
  provider for headless Linux (the server's Neovim 0.7 has none built in).
- **tmux:** prefix is the backtick. `allow-rename off` and Prezto `auto-title 'no'` so names stop being
  overwritten; windows are named after the folder. `default-command ""` is set after the plugins load because
  tmux-sensible would wrap panes in `reattach-to-user-namespace` (obsolete, not installed any more).
  Status bar shows the real public IP on purpose (`curl -m2`) plus `tmux/local_ip.sh`.
  `tmux.remote.conf` loads when `$SSH_CLIENT` is set; F12 toggles keys for nesting.
- **Vim:** 22 plugins. `vim-obsession` must stay: tmux-resurrect's nvim `session` strategy needs it. ALE replaced
  syntastic. `termguicolors` on. History is written on buffer events so a killed terminal keeps it (Startify
  warns "can't read viminfo" only when the recent-files list is empty). Vim sets `encoding=utf-8` itself.
- **Removed on purpose:** DNS-watch scripts (dotfiles must not touch DNS, Tailscale is used), `vpn-startup.sh`,
  snap (nothing here uses it), pydistutils, the `garrett` theme, obsolete macOS defaults (Dashboard, Safari and
  Messages sandboxed keys, `LSQuarantine`, SoftwareUpdate schedule).
- **Installers:** Homebrew via the current `install.sh` script; apt runs `DEBIAN_FRONTEND=noninteractive` and
  enables `en_US.UTF-8` in `/etc/locale.gen` (Debian ignores a name passed to `locale-gen`); nvm is pinned and
  installed with `PROFILE=/dev/null` (otherwise it appends to `~/.zshrc`, a symlink into this repo); Python goes
  through the pyenv shim with `python -m pip`; zshrc falls back to `C.UTF-8` if `en_US` is missing.
- **git helpers** are guarded: `git-nuke` refuses main/master/develop/dev, `git-delete-local-merged` never deletes them.

## Gotchas
- `git/gitignore.symlink` is `~/.gitignore`; tools append to it (it already gained `**/.claude/settings.local.json`).
- `zsh/zshrc.symlink` ends with a block managed by `taloctl install`/`uninstall`; leave it as is.
- Claude Code here: `~/.claude/settings.json` has a hook limiting edits to `~/Code` and `~/.dotfiles`, and
  `blockReadsOutsideWorkingDirectories` is on (use `/add-dir`). In that shell `grep` is `ugrep` (`'^*'` is invalid).
- The auto-mode classifier sometimes errors on Bash ("no verdict"); retry once or switch permission mode.
- Docker Desktop must be started by hand (`open -a Docker`) before the container tests.

## Testing
`script/docker-test/run.sh [debian12|ubuntu2404]` (about 3 minutes). Last result: bootstrap, install, install
again and `dot` all rc=0 on both; `en_US.UTF-8`; no startup warnings; Python 3.14, Node 24 LTS, yarn, tsc.
**Not covered:** the interactive macOS bootstrap (`set-defaults`, Finder/Dock restart), desktop Linux, a real
tty for the `clip` OSC 52 fallback. Machines: Mac verified by hand; server verified by running `dot`.

## Updating the server
`cd ~/.dotfiles && git pull`, then `tmux/install.sh` (links scripts) or the `ln -sfn` for `local_ip.sh`,
`tmux source ~/.tmux.conf`, in Neovim `:PlugInstall` then `:PlugClean`, re-run `apt-get/install.sh` for the locale.
Also `npm install -g semistandard` if ALE should lint JavaScript.

## Open items
- `TALOCTL_PVE="root@madrid-server"` sits in the public `zshrc` block.
- `RC_EXPAND_PARAM` and `complete_aliases` are set globally in `zsh/config.zsh` (style choice, can surprise scripts).
- `git-edit-new` breaks on filenames with spaces.
- `QLEnableTextSelection` in `osx/set-defaults.sh` may no longer do anything on macOS 26.
- `tmux/local_ip.sh` and `bin/clip` are untested on a desktop Linux session.
