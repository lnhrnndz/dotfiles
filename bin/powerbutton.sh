#!/bin/sh

options="\
lock\n\
suspend\n\
hibernate\n\
hybrid sleep\n\
suspend then hybernate\n\
shut down\n\
reboot\n\
cancel"

opts="$(echo -e -n "$options" | tr -d ' ')"

n=0
for i in $opts; do
    n=$(( $n + 1))
done

choice=$(echo -e "$options" | dmenu -c -i -l $n -p "What do?")

case "$choice" in 
    lock)
        i3lock -c 000000 ;;
    suspend)
        loginctl suspend ;;
    hibernate)
        loginctl hibernate ;;
    hybrid\ sleep)
        loginctl hybrid-sleep ;;
    suspend\ then\ hybernate)
        loginctl suspend-then-hybernate ;;
    shut\ down)
        loginctl poweroff ;;
    reboot)
        loginctl reboot ;;
    cancel)
        exit 1 ;;
esac
