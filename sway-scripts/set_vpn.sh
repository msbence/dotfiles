#! /bin/bash

ACTIVE_VPN=$(nmcli con show --active | grep -e vpn -e wireguard | head -n 1 | cut -d ' ' -f 1)
VPN_LIST=$(nmcli con sh | grep -e vpn -e wireguard | cut -d ' ' -f 1)
BEMENU_ARGS='-l 20 -i --nb #ffaa00 --nf #000000 --sb #7788ff --sf #000000 --ff #ffaa00 --fb #000000 --tb #ff9966 --tf #000000 --hb #7788ff --hf #000000'
CHOICE=""
if [ -n "${ACTIVE_VPN}" ]; then
  CHOICE=$(echo -e "OFF\n$VPN_LIST" | bemenu $BEMENU_ARGS --fn "Nova Light Ultra SSi 20" -p "SELECT VPN:")
else
  CHOICE=$(echo -e "$VPN_LIST" | bemenu $BEMENU_ARGS --fn "Nova Light Ultra SSi 20" -p "SELECT VPN:")
fi
if [ -n "${CHOICE}" ]; then
  if [ "$CHOICE" == "OFF" ]; then
    nmcli connection down $ACTIVE_VPN
  else
    nmcli connection up $CHOICE
  fi
fi
