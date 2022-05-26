#!/bin/sh

xrdb -merge $HOME/.Xresources

xbanish &

setxkbmap -option caps:ctrl_modifier

dunst &
dwm-status &

sxhkd -c $HOME/.config/sxhkd/sxhkdrc &
sxhkd -c $HOME/.config/sxhkd/sxhkdrcdwm &

exec dbus-run-session dwm
