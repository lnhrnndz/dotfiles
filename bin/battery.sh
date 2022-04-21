#!/bin/bash
# script to add battery status to tmux status bar

if [ -e /sys/class/power_supply/BAT0/capacity ]; then
    battery="$(cat /sys/class/power_supply/BAT0/capacity)"
    batterystatus="$(cat /sys/class/power_supply/BAT0/status)"
elif [ -e /sys/class/power_supply/BAT1/capacity ]; then
    battery="$(cat /sys/class/power_supply/BAT1/capacity)"
    batterystatus="$(cat /sys/class/power_supply/BAT1/status)"
else
    exit 1
fi


if [ $batterystatus == Charging ]; then
    echo "#[bg=colour96,fg=colour223] $battery% "
    exit 0
fi

if [ $(( $battery > 20 )) == 1 ]; then
    echo "#[bg=colour142,fg=colour234] $battery% "
elif [ $(( $battery > 5 )) == 1 ]; then
    echo "#[bg=colour208,fg=colour234] $battery% "
else
    echo "#[bg=colour124,fg=colour223] !!!!! $battery% !!!!! "
fi

exit 0