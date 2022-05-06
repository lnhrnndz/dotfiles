#!/bin/sh

prompt () {
    PROMPT="$1"
    printf "%s [y/n] " "$PROMPT"
    read -r ANSWER
    case $ANSWER in
        Y|y) return ;;
        N|n) return ;;
	    *) prompt "$1" ;;
    esac
}

prompt "Prompt to stow every folder individually?"
[ "$ANSWER" = "y" ] && echo "" && NOPROMPT="n" || NOPROMPT="y"

IGNORE="wallpapers themes"
for DIR in *; do
    [ -d "$DIR" ] || continue
    echo "$IGNORE" | grep -qw "$DIR" && continue
    if [ "$NOPROMPT" = "n" ]; then
        prompt "stow $DIR?"
        [ "$ANSWER" = "y" ] && stow "$DIR" -t "$HOME"
    else
        stow "$DIR" -t "$HOME"
    fi
done

echo ""
prompt "run fc-cache -f -v to cache fonts?"
[ "$ANSWER" = "y" ] && fc-cache -f -v

exit 0
