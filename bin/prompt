#!/bin/sh

# example usage:
# ./prompt "Shutdown?" "poweroff"

[ $(echo -e "No\nYes" | dmenu -i -p "$1") \
== "Yes" ] && $2