#!/usr/bin/env bash

# TODO: hacerlo con inotify para que no sea tan ineficiente ?

while true; do
	sleep 60

	#used=$(du -cs isim *.wdb | tail -n -1 | awk '{ print $1 }')
	used=$(du -cs . | tail -n -1 | awk '{ print $1 }')
	if [ "$used" -lt 30000 ]; then
		continue;
	fi

	notify_cmd="xmessage -nearmouse -buttons okay:0,snooze:2 Too much space used, please close and cleanup"
	until $notify_cmd; do
		sleep 20
	done
done
