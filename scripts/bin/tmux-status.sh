#!/bin/bash

fo=$(xrdb -query | grep -F "foreground" | cut -f 2)
c0=$(xrdb -query | grep -F "color0" | cut -f 2)
c4=$(xrdb -query | grep -F "color4" | cut -f 2)
c7=$(xrdb -query | grep -F "color7" | cut -f 2)
c8=$(xrdb -query | grep -F "color8" | cut -f 2)
c6=$(xrdb -query | grep -F "color6" | cut -f 2)
c14=$(xrdb -query | grep -F "color14" | cut -f 2)
c1=$(xrdb -query | grep -F "color1" | cut -f 2) #critical battery


if [ "$1" = 1 ]; then
    printf "#[bg=$fo,fg=$c0] #S "
elif [ "$1" = 2 ]; then
    #printf "#[bg=colour237,fg=colour239 nobold, nounderscore, noitalics]"
    timedate=$(date '+%F %H:%M')
    printf "#[bg=$c0,fg=$foce] $timedate "
    #printf "#[bg=colour239,fg=colour248,nobold,noitalics,nounderscore]"
    printf "#[bg=$fo,fg=$c0] #h "
    printf " BAT "
elif [ "$1" = 3 ]; then
    printf "#[bg=$c4,fg=$c0,nobold] [#I] #W#{?window_zoomed_flag,*Z,} "
elif [ "$1" = 4 ]; then
    printf "#[bg=$c0,fg=$fo] [#I] #W "
    #printf "#[bg=colour237,fg=colour239,noitalics]"
else
    echo "fuck"
fi
