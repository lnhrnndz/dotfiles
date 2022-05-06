#!/bin/sh

for FILE in *; do
    [ ! -d "$FILE" ] && continue
    stow -D "$FILE" -t "$HOME"
done
