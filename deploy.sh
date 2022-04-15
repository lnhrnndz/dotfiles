#!/bin/bash

echo "WARNING: Your dotfiles will be removed and replaced if you proceed."
echo "WARNING: Study deploy.sh to find out which files will be replaced"
echo "WARNING: This script only works if it is located in $HOME/dotfiles"
read -p "Proceed? [y/N] " proceed

symlink () {
    targetdir="$HOME/dotfiles/$1"
    if [ -z "$2" ]; then 
        destdir="$HOME" 
    else
        destdir="$HOME/$2"
    fi

    ls -A "$1" | while read file; do
        rm -rf "$destdir/$file"
        ln -s "$targetdir/$file" "$destdir/$file"
    done
}

case $proceed in
    Y|y)
        symlink home 
        symlink config .config

        rm -rf "$HOME/bin"; ln -s "$(pwd)/bin" "$HOME/bin"
        #rm -rf "$HOME/.local/share/fonts"; ln -s "$HOME/dotfiles/local/share/fonts" "$HOME/.local/share/fonts"
        ;;
    *) exit 1 ;;
esac
