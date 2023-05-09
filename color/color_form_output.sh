#!/usr/bin/env bash

readonly END="\033[0m"
readonly BLACK="\033[0;30m"
readonly BLACKB="\033[1;30m"
readonly WHITE="\033[0;37m"
readonly WHITEB="\033[1;37m"
readonly RED="\033[0;31m"
readonly REDB="\033[1;31m"
readonly GREEN="\033[0;32m"
readonly GREENB="\033[1;32m"
readonly YELLOW="\033[0;33m"
readonly YELLOWB="\033[1;33m"
readonly BLUE="\033[0;34m"
readonly BLUEB="\033[1;34m"
readonly PURPLE="\033[0;35m"
readonly PURPLEB="\033[1;35m"
readonly LIGHTBLUE="\033[0;36m"
readonly LIGHTBLUEB="\033[1;36m"

###############################################################################
# format $2 message so it is $1 color
# arguments: prefix, message
# output: colorful message
# return: 2 if wrong color
###############################################################################
color::form_output() {
	if [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]] || [[ -z "$1" ]]; then
		name="color::form_output"
		echo -e "apply color to any text"
		echo -e "USAGE"
		echo -e "- show this message (default)"
		echo -e "\t $name [-h, --help]"
		echo -e "- get colored message"
		echo -e "\t $name color message"
		repeat_char - 80
		echo "by @mb6ockatf, Mon 08 May 2023 09:05:30 PM MSK"
		return 0
	fi
	local color="$1" message="$2"
	case "$color" in
		black)      color="${BLACK}"      ;;
		blackb)     color="${BLACKB}"     ;;
		white)      color="${WHITE}"      ;;
		whiteb)     color="${WHITEB}"     ;;
		red)        color="${RED}"        ;;
		redb)       color="${REDB}"       ;;
		green)      color="${GREEN}"      ;;
		greenb)     color="${GREENB}"     ;;
		yellow)     color="${YELLOW}"     ;;
		yellowb)    color="${YELLOWB}"    ;;
		blue)       color="${BLUE}"       ;;
		blueb)      color="${BLUEB}"      ;;
		purple)     color="${PURPLE}"     ;;
		purpleb)    color="${PURPLEB}"    ;;
		lightblue)  color="${LIGHTBLUE}"  ;;
		lightblueb) color="${LIGHTBLUEB}" ;;
		*)          return 2              ;;
	esac
	echo -e "${color}${message}${END}"
}