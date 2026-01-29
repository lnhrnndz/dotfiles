#!/bin/sh

while [[ true ]]; do
	CONFLICT_FILES=$(rg --files | rg 'sync-conflict')
	if [ -z "$CONFLICT_FILES" ]; then
		echo "all done"
		break
		#exit 0
	fi

	SYNC_CONFLICT_FILE=$(echo "$CONFLICT_FILES" | fzf --height=~40% --layout=reverse)
	if [ -z "$SYNC_CONFLICT_FILE" ]; then
		echo "aborting"
		exit 1
	fi

	CURRENT_FILE=$(echo "$SYNC_CONFLICT_FILE" | sed 's/sync-conflict.*/md/')
	if [ ! -e "$SYNC_CONFLICT_FILE" ]; then
		echo "error: $CURRENT_FILE doesn't exist"
		exit 1
	fi

	#COMMON_ANCESTOR=

	echo "vimdiff $CURRENT_FILE $SYNC_CONFLICT_FILE"
	vimdiff $CURRENT_FILE $SYNC_CONFLICT_FILE

	read -p "delete ${SYNC_CONFLICT_FILE}? [y/N] " yn
	case "$yn" in
		[Yy] ) rm "$SYNC_CONFLICT_FILE" ;;
		[Nn] ) continue ;;
		* ) continue ;;
	esac

done
