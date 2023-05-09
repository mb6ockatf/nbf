#!/usr/bin/env bash
###############################################################################
# refactor *.sh files recirsively in the current folder
# original files are renamed into oldname.orig, like `artictic style` does with
# c files
# basically, just removes empty lines and adds ones after code blocks
# output: formatted sh files
###############################################################################
refactor::sh(){
	while IFS= read -r -d '' filename; do
		cp "$filename" "${filename}.orig"
		sed -i '/^\s*$/d; /.*\}$/G' "$filename"
	done <	<(find ./ -type f -iname "*.sh")
}
