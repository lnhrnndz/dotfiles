#!/bin/sh

help () {
  echo "orphanhunter

orphanhunter searches for files that have no other files that link to them.

OPTIONS:

-d DIR              directory to be searched for orphans
-s DIR              directory to search for matches
-i PATTERN          ignore matches that include the regex PATTERN
-p                  prompt for deletion of orphans
"
}

INPUTDIR=$(pwd)
SEARCHDIR=$(pwd)
IGNORE="nonenonenonenonenonenone"
PROMPT=0

while getopts ":hd:s:i:p" opt; do
  case $opt in
    h) help ; exit ;;
    d) INPUTDIR="$OPTARG" ;;
    s) SEARCHDIR="$OPTARG" ;;
    i) IGNORE="$OPTARG" ;;
    p) PROMPT=1 ;;
    \?) echo "Invalid option: -$OPTARG" >&2 ; exit ;;
    :) echo "Option -$OPTARG requires an argument" >&2 ; exit ;;
  esac
done

if [ ! -d "$INPUTDIR" ]; then
  echo "No such directory: $INPUTDIR/"
  exit
elif [ ! -d "$SEARCHDIR" ]; then
  echo "No such directory: $SEARCHDIR/"
  exit
fi

for FILE in "$INPUTDIR"/*.md ; do
  FILE=$(echo "$FILE" | sed "s|^$SEARCHDIR/||")
  [ "$FILE" = "$(basename "$FILE")" ] && FILE="./$FILE"
  MATCHES=$(rg "$FILE" "$SEARCHDIR" -l | grep -v "$IGNORE")
  #echo "$MATCHES"
  if [ -z "$MATCHES" ] ; then
    FILE=$(echo "$FILE" | sed 's|^\\\./|src/|')
    echo "ORPHAN FOUND: $FILE"
    [ "$PROMPT" -eq 1 ] && rm -i "$FILE"
  fi
done
