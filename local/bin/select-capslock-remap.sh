#!/bin/sh

options="\
Capslock\n\
Control\n\
Super\n\
Escape\n\
Swap Escape\n\
Backspace\n\
nocaps\n\
None"

opts="$(echo -e -n "$options" | tr -d ' ')"

n=0
for i in $opts; do
    n=$(( $n + 1))
done

choice=$(echo -e "$options" | dmenu -c -i -l $n -p "Select remap") && setxkbmap -option

case "$choice" in 
    Capslock)
        remap="capslock" ;;
    Control)
        remap="ctrl_modifier" ;;
    Super)
        remap="super" ;;
    Escape)
        remap="escape" ;;
    Swap\ Escape)
        remap="swapescape" ;;
    None)
        remap="none" ;;
esac

setxkbmap -option caps:$remap

