#!/bin/bash

chmodrecursively () {
    ls -A | while read file; do
        if [ -d "$file" ]; then
            cd "$file"
            chmodrecursively
            cd ..
        elif echo "$file" | grep -F .sh > /dev/null; then
            chmod 755 -c "$file"
        else
            chmod 644 -c "$file"
        fi
    done
}

chmodrecursively