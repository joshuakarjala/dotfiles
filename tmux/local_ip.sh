#!/bin/sh
#
# Print this machine's primary local IPv4 address (macOS and Linux),
# for the tmux status bar.

if [ "$(uname -s)" = "Darwin" ]; then
  iface=$(route -n get default 2>/dev/null | awk '/interface:/ {print $2}')
  ipconfig getifaddr "${iface:-en0}" 2>/dev/null || ipconfig getifaddr en0 2>/dev/null
else
  ip -4 route get 1.1.1.1 2>/dev/null | awk '{ for (i = 1; i < NF; i++) if ($i == "src") { print $(i + 1); exit } }'
fi
