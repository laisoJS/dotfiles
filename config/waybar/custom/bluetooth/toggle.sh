#!/bin/bash

# Check current Bluetooth status
STATUS=$(bluetoothctl show | grep "Powered: yes" | wc -l)

if [ "$STATUS" -eq 1 ]; then
    # If Bluetooth is On, turn it off
    bluetoothctl power off
else
    # If Bluetooth is off, turn it On
    bluetoothctl power on
fi

