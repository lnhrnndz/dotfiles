#!/bin/sh
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

charging="#[bg=colour119,fg=colour000]"
normal="#[bg=colour40,fg=colour000]"
low="#[bg=colour214,fg=colour234]"
critical="#[bg=colour160,fg=colour255]"


if [ "$batterystatus" = Charging ] && [ "$battery" -lt 99 ]; then
    echo "$charging $battery% "
    exit 0
fi

if [ "$(( battery > 20 ))" = 1 ]; then
    echo "$battery% "
elif [ "$(( battery > 5 ))" = 1 ]; then
    echo "$battery% "
else
    echo "$critical !!!!! $battery% !!!!! "
fi

exit 0
