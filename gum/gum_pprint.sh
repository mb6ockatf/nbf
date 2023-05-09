#!/usr/bin/env bash

###############################################################################
# pretty print message with gum
# arguments: $1 - message
# output: gum formatted message
###############################################################################
pprint() {
	message="$1"
	message=$(gum style --border normal --border-foreground 3 "$message")
	echo "$message"
}