#!/bin/bash

options="$(ls "$HOME"/bin | awk '/^dmenu-/ {print}')"
#options="$(ls "$HOME"/bin | grep -F dmenu-)"

n="$(echo "$options" | wc -w)"

script=$(echo -e "$options" | dmenu -m 0 -c -i -l $n -p "Select script")

[ -z "$script" ] && exit 1

exec "$script"
