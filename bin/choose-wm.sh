#!/bin/bash

echo "Current wm: $WM"

wms="dwm bspwm"

n=1
for wm in $wms; do
    echo "[$n] $wm"
    n=$(($n+1))
done
echo "[$n] cancel"

read -p "wm: " wm

case $wm in
    1) export WM="dwm" ;;
    2) export WM="bspwm" ;;
    3) exit ;;
    4) echo "Invalid option" ;;
esac
