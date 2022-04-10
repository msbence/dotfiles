#!/usr/bin/env sh
set -euo pipefail

SELECTED="$(wl-clipboard-history -p $(wl-clipboard-history -l 20 | fzf --with-nth 2.. -d , | cut -d ',' -f1))"
echo $SELECTED | wl-copy
