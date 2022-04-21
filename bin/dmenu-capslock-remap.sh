#!/bin/bash

options="\
Capslock
Control
Super
Escape
Swap Escape
Backspace
nocaps
None"

n="$(echo -n "$options" | tr -d ' ' | wc -w)"

choice=$(echo -e "$options" | dmenu -m 0 -c -i -l $n -p "Select remap") && setxkbmap -option

case "$choice" in 
    "Capslock")
        remap="capslock" ;;
    "Control")
        remap="ctrl_modifier" ;;
    "Super")
        remap="super" ;;
    "Escape")
        remap="escape" ;;
    "Swap Escape")
        remap="swapescape" ;;
    "None")
        remap="none" ;;
esac

setxkbmap -option caps:$remap