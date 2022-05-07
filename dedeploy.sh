#!/bin/sh

for FILE in *; do
    [ ! -d "$FILE" ] && continue
    stow -D "$FILE" -v -t "$HOME"
done
