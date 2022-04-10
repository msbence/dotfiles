#! /bin/bash

CONNECTED=$(bluetoothctl info 74:5B:C5:73:69:31 | grep "Connected: yes")
if [ -n "${CONNECTED}" ]; then
BATT_LEVEL=$(python3 $HOME/.local/lib/python3.9/site-packages/bluetooth_battery/bluetooth_battery.py 74:5B:C5:73:69:31 | cut -d ' ' -f 6)
cat << EOF
{"icon": "bluetooth", "state": "Idle", "text": "JBL-BT ${BATT_LEVEL}"}
EOF
else
echo '{"icon": "bluetooth", "state": "Idle", "text": ""}'
fi
