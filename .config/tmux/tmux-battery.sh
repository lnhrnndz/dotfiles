#!/bin/sh
# script to add battery status to tmux status bar

chargning_col="#[bg=colour40,fg=colour000]"
low_col="#[bg=colour214,fg=colour234]"
critical_col="#[bg=colour160,fg=colour255]"


battery="$(system_profiler SPPowerDataType | awk -F": " '/State of Charge/ { print $2 }')"
charging="$(system_profiler SPPowerDataType | awk -F": " '/Charging/ { print $2 }')"

if [ "$charging" = Yes ] && [ "$battery" -lt 99 ]; then
	printf "%s %s%% " "$chargning_col" "$battery"
	exit 0
fi

if [ "$(( battery > 20 ))" = 1 ]; then
	printf " %s%% " "$battery"
elif [ "$(( battery > 5 ))" = 1 ]; then
	printf "%s %s%% " "$low_col" "$battery"
else
	printf "%s !!!!! %s%% !!!!! " "$critical_col" "$battery"
fi

printf "\\n"
