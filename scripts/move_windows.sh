#!/usr/bin/env bash

# Move windows to the top left if they are outside of screen
# Useful for switching from a monitor to laptop screen

#dump the list of windows to a file
screen_x=$(wattr w $(lsw -r))
screen_y=$(wattr h $(lsw -r))
lsw|grep -v 0x00800001 > /tmp/window_list.txt

while read p; do
	window_x=$(wattr x $p)
	window_y=$(wattr y $p)
	window_width=$(wattr w $p)
	window_height=$(wattr h $p)
	if [[ $window_x -ge $screen_x ]]; then
		wtp 0 0 $window_width $window_height $p
	elif [[ $window_y -ge $screen_y ]]; then
		wtp 0 0 $window_width $window_height $p
	fi
done < /tmp/window_list.txt
#delete the temporary file
rm /tmp/window_list.txt
exit 0
