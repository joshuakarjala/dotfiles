#!/bin/bash
# runs as the normal user; every stage is timed and its exit code recorded, nothing aborts the run
stage() { echo; echo "######## $1 ($(date +%H:%M:%S))"; }

# copy the tracked files as they are in the working tree (includes uncommitted fixes), like a checkout.
# -c (not git config --global) so no ~/.gitconfig exists before bootstrap, like a really fresh machine
mkdir -p ~/.dotfiles
(cd /src && git -c safe.directory='*' ls-files -z | tar --null -T - -cf -) | tar -xf - -C ~/.dotfiles || { echo "COPY FAILED"; exit 1; }
test ! -e ~/.gitconfig && echo "fresh home: no ~/.gitconfig yet"
cd ~/.dotfiles
echo "dotfiles copied: $(find . -type f | wc -l) files"

stage "1. bootstrap"
SECONDS=0
printf 'Test User\ntest@example.com\n' | script/bootstrap
echo "RESULT bootstrap rc=$? (${SECONDS}s)"

stage "2. install (first run)"
SECONDS=0
script/install
echo "RESULT install rc=$? (${SECONDS}s)"

stage "3. verify (fresh login zsh)"
echo "--- zsh startup stderr/stdout:"
zsh -ic 'exit' 2>&1 | head -20
echo "--- locale:"; zsh -ic 'locale' 2>&1 | head -4
echo "--- tools:"
zsh -ic '
for c in zsh tmux nvim vim fzf fzy ag ack pyenv rbenv; do printf "%-8s" $c; command -v $c || echo MISSING; done
echo "python: $(python --version 2>&1)  pip: $(python -m pip --version 2>&1 | cut -c1-40)"
echo "node:   $(node --version 2>&1)  npm: $(npm --version 2>&1)  yarn: $(yarn --version 2>&1)  tsc: $(tsc --version 2>&1)"
echo "nvm:    $(command -v nvm)"
echo "snap in PATH: $(echo $PATH | tr ":" "\n" | grep -c snap)"
' 2>&1 | grep -v '^$'
echo "--- links:"
ls -l ~/.zshrc ~/.tmux.conf ~/.vimrc ~/.gitconfig 2>&1 | awk '{print $9,$10,$11}'
echo "--- gitconfig:"; sed -n '6,10p' ~/.gitconfig
echo "--- tmux plugins / config:"; ls ~/.tmux/plugins 2>&1 | tr '\n' ' '; echo
tmux -L t -f ~/.tmux.conf start-server \; show -gv default-command \; show -gv set-clipboard \; show -gwv allow-rename 2>&1 | head -5; tmux -L t kill-server 2>/dev/null
ls -l ~/.tmux/local_ip.sh ~/.tmux/renew_env.sh 2>&1 | awk '{print $9,$10,$11}'; echo "local_ip: $(~/.tmux/local_ip.sh)"
echo "--- nvim headless load (errors would show):"
nvim --headless -c 'qa' 2>&1 | head -5; echo "nvim rc=$?"
echo "--- prezto themes:"; ls ~/.zprezto/modules/prompt/functions | grep -E 'josh|garrett'

stage "4. install (second run = idempotency)"
SECONDS=0
script/install
echo "RESULT install-again rc=$? (${SECONDS}s)"

stage "5. dot (upgrade flow)"
SECONDS=0
bin/dot </dev/null
echo "RESULT dot rc=$? (${SECONDS}s)"

stage "6. startup after upgrade"
zsh -ic 'exit' 2>&1 | head -10
echo "DONE"
