#!/bin/sh

alias lock="i3lock -e -c 282A36"

options="\
lock\n\
suspend\n\
lock then suspend\n\
hibernate\n\
hybrid sleep\n\
suspend then hibernate\n\
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
        lock ;;
    suspend)
        loginctl suspend ;;
    lock\ then\ suspend)
        lock
        sleep 2
        loginctl suspend
        ;;
    hibernate)
        loginctl hibernate ;;
    hybrid\ sleep)
        loginctl hybrid-sleep ;;
    suspend\ then\ hibernate)
        loginctl suspend-then-hybernate ;;
    shut\ down)
        loginctl poweroff ;;
    reboot)
        loginctl reboot ;;
    cancel)
        exit 1 ;;
esac
