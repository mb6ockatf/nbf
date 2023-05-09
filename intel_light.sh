#!/usr/bin/env bash

###############################################################################
# change screen light if intel_backlight settings are present. requires sudo
# arguments: [night | -inc VALUE | -dec VALUE]
# output: nothing
# return: 2 if backlight config is not available
###############################################################################
light() {
	file="/sys/class/backlight/intel_backlight/brightness"
	if [[ ! -f $file ]]; then
		echo "intel_backlight settings are not available"
		return 2
	fi
	current=$(cat "$file")
	new="$current"
	if [ "$1" = "-dec" ]; then
		new=$(( current - $2 ))
	elif [ "$1" = "-inc" ]; then
		new=$(( current + $2 ))
	elif [ "$1" = "night" ]; then
		new=1
	fi
	[[ "$new" -ge 0 ]] || exit
	echo "$new" | sudo tee "$file"
}