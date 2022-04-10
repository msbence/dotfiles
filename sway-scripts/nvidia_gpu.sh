#! /bin/bash

PSTATE=$(cat /sys/bus/pci/devices/0000:00:01.0/power_state)
if [ $PSTATE == "D0" ]
then
echo "DGPU ACTIVE"
else
echo "DGPU STANDBY"
fi
