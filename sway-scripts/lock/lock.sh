#!/bin/sh

# GLOBAL VARS
YELLOW='ffaa00ff'
RED='ff2200ff'

CLAYOUT=$(cat $HOME/.current_screenlayout)
LOCK_ARGS=""

while IFS= read -r line; do
  OUTPUTS+=( "$line" )
done < <(swaymsg -t get_outputs | jq -r '.[] | select(.active == true) | "\(.make) \(.model) \(.serial):\(.name)"' | sed "s/ /-/g")

# LAYOUT SPECIFIC VARS
if [ $CLAYOUT == "OFFICE" ]
then
BAR_XOFFSET=80
BAR_YOFFSET=21
BAR_HMAX=41
BAR_WMAX=2220
STATUS_XOFFSET=5
STATUS_YOFFSET=80
else
BAR_XOFFSET=60
BAR_YOFFSET=15
BAR_HMAX=30
BAR_WMAX=1660
STATUS_XOFFSET=5
STATUS_YOFFSET=80
fi

# SETTING UP LOCK
for (( i=0; i<${#OUTPUTS[@]}; i++ ));
do
  OUTPUT_NAME=$(echo ${OUTPUTS[$i]} | cut -d ':' -f 1)
  OUTPUT_ID=$(echo ${OUTPUTS[$i]} | cut -d ':' -f 2)
  IMAGE="$HOME/sway-scripts/lock/img/$CLAYOUT-$OUTPUT_NAME.png"
  LOCK_ARGS="$LOCK_ARGS --image ${OUTPUT_ID}:${IMAGE}"
done

echo $LOCK_ARGS
swaylock \
$LOCK_ARGS \
--daemonize \
--color 000040 \
--show-failed-attempts \
--indicator \
--timestr "%H:%M:%S" \
--datestr "%Y-%m-%d %A" \
--indicator-x-position "100" \
--indicator-y-position "120" \
--indicator-radius 150 \
--font "Nova Light Ultra SSi" \
--font-size 72 \
--line-uses-ring \
--ring-color 00000000 --ring-clear-color 00000000 --ring-caps-lock-color 00000000 \
--ring-ver-color 00000000 --ring-wrong-color 00000000 --separator-color 00000000 \
--inside-color 00000000 --inside-clear-color 00000000 --inside-caps-lock-color 00000000 \
--inside-ver-color 00000000 --inside-wrong-color 00000000 \
--bs-hl-color 00000000 --caps-lock-bs-hl-color 00000000 --caps-lock-key-hl-color 00000000 \
--key-hl-color 00000000 \
--grace 2