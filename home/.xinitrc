#!/bin/sh

xrdb -merge $HOME/.Xresources
unclutter -grab -idle 4 &
sxhkd -c $HOME/.config/sxhkd/sxhkdrc &


case $WM in
    dwm)
        exec $HOME/scripts/dwm-status.sh & #|| xsetroot -name "failed"
        sxhkd -c $HOME/.config/sxhkd/sxhkdrcdwm &
        exec dbus-launch --sh-syntax --exit-with-session dwm
        ;;
    bspwm) 
        sxhkd -c $HOME/.config/sxhkd/sxhkdrcbspwm &
        polybar example &
        exec bspwm
        ;;
    *) # default if $WM is not defined
        exec $HOME/scripts/dwm-status.sh & #|| xsetroot -name "failed"
        sxhkd -c $HOME/.config/sxhkd/sxhkdrcdwm &
        exec dbus-launch --sh-syntax --exit-with-session dwm
        ;;
esac
