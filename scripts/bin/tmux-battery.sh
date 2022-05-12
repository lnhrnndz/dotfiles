#!/bin/sh
# script to add battery status to tmux status bar

charging="#[bg=colour40,fg=colour000]"
low="#[bg=colour214,fg=colour234]"
critical="#[bg=colour160,fg=colour255]"

for BATTERY in /sys/class/power_supply/BAT* ; do

   battery="$(cat "${BATTERY}"/capacity)"
    batterystatus="$(cat "${BATTERY}"/status)"

    if [ "$batterystatus" = Charging ] && [ "$battery" -lt 99 ]; then
        printf "%s %s%% " "$charging" "$battery"
        exit 0
    fi

    if [ "$(( battery > 20 ))" = 1 ]; then
        printf " %s%% " "$battery"
    elif [ "$(( battery > 5 ))" = 1 ]; then
        printf "%s %s%% " "$low" "$battery"
    else
        printf "%s !!!!! %s%% !!!!! " "$critical" "$battery"
    fi
done

printf "\\n"
