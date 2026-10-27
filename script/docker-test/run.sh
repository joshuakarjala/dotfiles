#!/usr/bin/env bash
#
# Clean-container test of bootstrap -> install -> install again -> dot on Debian 12 and Ubuntu 24.04.
#
#   script/docker-test/run.sh              # both distros, in parallel (~3 minutes)
#   script/docker-test/run.sh debian12     # just one (debian12 | ubuntu2404)
#
# Needs a running Docker daemon (macOS: open -a Docker). The container gets the tracked files from the
# WORKING TREE (so uncommitted changes are tested, new untracked files are not - `git add` them first)
# and runs as a normal sudo user with no ~/.gitconfig, like a fresh machine.
# Logs: $OUT/<distro>/log.txt (raw) and clean.txt (readable). Written to work with macOS bash 3.2.

HERE=$(cd "$(dirname "$0")" && pwd)
REPO=$(cd "$HERE/../.." && pwd)
OUT=${OUT:-${TMPDIR:-/tmp}/dotfiles-docker-test}

image_for () {
  case "$1" in
    debian12)   echo debian:12 ;;
    ubuntu2404) echo ubuntu:24.04 ;;
    *)          return 1 ;;
  esac
}

targets="$*"
[ -n "$targets" ] || targets="debian12 ubuntu2404"

for name in $targets; do
  image_for "$name" >/dev/null || { echo "unknown target: $name (use debian12 or ubuntu2404)"; exit 1; }
done

docker info >/dev/null 2>&1 || { echo "Docker daemon isn't running (macOS: open -a Docker)"; exit 1; }

for name in $targets; do
  image=$(image_for "$name")
  rm -rf "${OUT:?}/$name"; mkdir -p "$OUT/$name"
  cp "$HERE/root-setup.sh" "$HERE/user-steps.sh" "$OUT/$name/"
  (
    docker run --rm -t --name "dotfiles-test-$name" -v "$REPO":/src:ro -v "$OUT/$name":/out "$image" \
      bash /out/root-setup.sh > "$OUT/$name/log.txt" 2>&1
    echo "EXIT $?" >> "$OUT/$name/log.txt"
  ) &
done
wait

# docker -t output has carriage returns and colour codes; clean it up for reading
for name in $targets; do
  tr '\r' '\n' < "$OUT/$name/log.txt" | sed 's/\x1b\[[0-9;?]*[A-Za-z]//g' > "$OUT/$name/clean.txt"
  echo "################ $name  (full log: $OUT/$name/clean.txt)"
  grep -aE "RESULT |^EXIT" "$OUT/$name/clean.txt"
  echo "locale:          $(grep -a '^LANG=' "$OUT/$name/clean.txt" | head -1)"
  echo "tools:           $(grep -aE '^python:|^node:' "$OUT/$name/clean.txt" | tr '\n' ' ' | cut -c1-160)"
  echo "startup noise:   $(awk '/--- zsh startup/{f=1} /--- locale/{f=0} f' "$OUT/$name/clean.txt" | grep -av '^\s*$' | sed -n '2,6p' | wc -l | tr -d ' ') lines (0 is good)"
  echo "error markers:   $(grep -acE '^E: |command not found|fatal:|Traceback|E474|Press ENTER' "$OUT/$name/clean.txt") (0 is good)"
done
