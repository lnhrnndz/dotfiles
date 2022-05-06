#!/bin/sh

xrandr --output HDMI-2 --primary --right-of eDP-1

xrdb -merge $HOME/.Xresources

/usr/bin/xbanish &

setxkbmap -option caps:ctrl_modifier


while type dwm > /dev/null; do
    pkill notification-da
    dunst &
    pkill dwm-status
    dwm-status &

    pkill sxhkd
    sxhkd -c $HOME/.config/sxhkd/sxhkdrc &
    sxhkd -c $HOME/.config/sxhkd/sxhkdrcdwm &

    dwm && continue || break
done
