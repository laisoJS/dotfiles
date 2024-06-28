#!/bin/bash

# Find all Waybar processes and select the second one
second_waybar_pid=$(pgrep -a waybar | awk 'NR == 2 {print $1}')

# Check if a second Waybar instance was found
if [ -n "$second_waybar_pid" ]; then
    kill $second_waybar_pid
else
    waybar -c $HOME/.config/waybar/power.jsonc
fi
