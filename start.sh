#!/bin/sh

xrdb -merge $HOME/.Xresources
sudo kbct remap --config $HOME/.config/kbct/kbct.yaml &

disown
