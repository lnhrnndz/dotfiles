#!/bin/sh

xrandr --output HDMI-2 --primary --right-of eDP-1

xrdb -merge $HOME/.Xresources

$HOME/xbanish/xbanish &

setxkbmap -option caps:ctrl_modifier


while type dwm > /dev/null; do
    pkill dwm-status
    exec dwm-status &

    pkill sxhkd
    sxhkd -c $HOME/.config/sxhkd/sxhkdrc &
    sxhkd -c $HOME/.config/sxhkd/sxhkdrcdwm &

    dwm && continue || break
done
