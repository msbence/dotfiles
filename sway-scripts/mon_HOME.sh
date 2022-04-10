#!/bin/bash

# SET DISPLAY CONFIG
$HOME/.screenlayout/HOME.sh
echo "HOME" > $HOME/.current_screenlayout

# SET WALLPAPER CONFIG
cat <<EOF > $HOME/.config/nitrogen/bg-saved.cfg
[xin_1]
file=/home/bmadarasz/Pictures/mass-effect-normandy-sr-1-video-games-normandy-wallpaper.jpeg
mode=5
bgcolor=#000000

[xin_0]
file=/home/bmadarasz/Pictures/mass-effect-normandy-sr-1-video-games-normandy-wallpaper.jpeg
mode=5
bgcolor=#000000
EOF

# WAIT FOR XRANDR
sleep 5

# RESTORE WALLPAPER
nitrogen --restore
