#!/bin/bash

options="$(ls "$HOME"/bin | grep -F dmenu- | sed s/^dmenu-// | sed s/.sh$//)"

n="$(echo "$options" | wc -w)"

script=$(echo "$options" | dmenu -m 0 -c -i -l $n -p "Select script")

[ -z "$script" ] && exit 1

exec "$script"