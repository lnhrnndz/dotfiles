#!/bin/bash

function prompt () {
    read -p "$1 [y/n] " answer
    case $answer in
        Y|y) echo 1 ;;
	N|n) echo 0 ;;
	*) echo $(prompt "$1") ;;
    esac
}


echo "WARNING: This script only works if it is located in $HOME/dotfiles"
[ $(prompt "Proceed?") -ne 0 ] || exit 1

ignore="wallpapers themes"

ls | while read file; do
    [ -d "$file" ] && [ -z "$(echo "$ignore" | grep -w "$file")" ] || continue
    stow -v "$file"
done

fc-cache -f -v

exit 0
