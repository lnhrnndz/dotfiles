#!/bin/sh

removeSpaces () {
    ls | while read file; do
        if [ -d "$file" ]; then
            cd "$file"
            removeSpaces
            cd ..
        fi
        mv "$file" "$(echo "$file" | sed 's/\ /_/g')"
    done
}
removeSpaces

exit 0
