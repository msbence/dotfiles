#! /bin/bash

set -x

LAYOUT_LIST=$(ls $HOME/.screenlayout | sed -e 's/\.sh$//')
DMENU_ARGS='-b -nb #ffaa00 -nf #000000 -sb #7788ff -sf #000000'
CHOICE=$(echo -e "$LAYOUT_LIST" | dmenu $DMENU_ARGS -fn "Nova Light Ultra SSi:pixelsize=27")
if [ -n "${CHOICE}" ]; then
  $HOME/i3-scripts/mon_$CHOICE.sh
fi
