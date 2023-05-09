#!/usr/bin/env bash
###############################################################################
# repeat character $1 $2 times
# arguments: $1 character, $2 number
# output: $2 characters
# default character is "-", default length is 80
###############################################################################
repeat_char() {
	local char="$1"
	local n="$2"
	[ -z "$char" ] && char="-"
	[ -z "$n" ] && n=80
	for (( i = 1; i < "$n"; i++ )); do
		echo -n "$char"
	done
}