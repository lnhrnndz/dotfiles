#!/bin/sh

prompt () {
    PROMPT="$1"
    [ -n "$2" ] && DEFAULT="$2" || DEFAULT=
    [ -n "$3" ] && OPTIONS="$3" || OPTIONS="[y/n]"
    printf "%s %s " "$PROMPT" "$OPTIONS"
    read -r ANSWER
    [ -z "$ANSWER" ] && ANSWER="$DEFAULT"
    case $ANSWER in
        Y|y) return ;;
        N|n) return ;;
	    *) prompt "$1" ;;
    esac
}

prompt "Prompt to stow every folder individually?" "n" "[y/N]"
[ "$ANSWER" = "y" ] && echo "" && NOPROMPT="n" || NOPROMPT="y"

IGNORE="none"
for DIR in *; do
    [ -d "$DIR" ] || continue
    echo "$IGNORE" | grep -qw "$DIR" && continue
    if [ "$NOPROMPT" = "n" ]; then
        prompt "stow $DIR?" "y" "[Y/n]"
        [ "$ANSWER" = "y" ] && stow "$DIR" -t "$HOME"
    else
        stow "$DIR" -t "$HOME"
    fi
done

echo ""
prompt "run fc-cache -f -v to cache fonts?" "y" "[Y/n]"
[ "$ANSWER" = "y" ] && fc-cache -f -v

exit 0
