#!/bin/bash

delim=" "

status() {

    echo " "

    # MUSIC

    # TEMPERATURE

    # INTERNET
    NETWORK="$(iw dev wlp0s20f3 link | awk '/SSID/{print $2}')"

    [ -z $NETWORK ] && NETWORK="N/A"

    echo "[NET $NETWORK]"

    echo "$delim"

    # VOLUME
    #VOLUMEON="$(amixer sget Master | awk -F"[][]" '/Left/ { print $4 }')" #<(amixer sget Master))"
    #VOLUME="$(amixer sget Master | awk -F"[][]" '/Left/ { print $2 }')" #<(amixer sget Master))"
    VOLUMEON="$(amixer sget Master | awk -F"[][]" '/Left/ { print $4 }')" #<(amixer sget Master))"
    SINK="$(pactl get-default-sink)"
    VOLUME="$(pactl get-sink-volume $SINK | awk '{ print $5 }')" #<(amixer sget Master))"

    [ "$VOLUMEON" = "off" ] && VOLUME="---"

    echo "[VOL $VOLUME]"

    echo "$delim"

    # RAM

    # CPU

    # BATTERY
    BATTERY=$(cat /sys/class/power_supply/BAT0/capacity)
    BATTERYSTATUS=$(cat /sys/class/power_supply/BAT0/status)

    if [ "$BATTERY" -lt 10 ] && [ ! "$BATTERYSTATUS" = "charging" ]; then
        if [ $(expr $(date +%S) % 2) -eq 0 ]; then
            echo "        "
        else
            echo "[BAT ${BATTERY}%]"
        fi
    else
        echo "[BAT ${BATTERY}%]"
    fi

    echo "$delim"

    # TIME & DATE
    date '+%a %F %H:%M:%S'

    echo " "
}

while true; do
    xsetroot -name "$(status | tr -d '\n')"
    sleep 1s
done