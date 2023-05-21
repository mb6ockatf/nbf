#!/usr/bin/env bash
###############################################################################
# refactor *.sh files recirsively in the current folder
# original files are renamed into oldname.orig, like `artictic style` does with
# c files
# basically, just removes empty lines, adds ones after code blocks and does
# `shfmt` formatting
# output: formatted sh files
###############################################################################
refactor::sh(){
	while IFS= read -r -d '' filename; do
		cp "$filename" "${filename}.orig"
		sed -i '/^\s*$/d; /.*\}$/G' "$filename"
		shfmt -l -w -ln bash -ci -fn -s "$filename"
	done <	<(find ./ -type f -iname "*.sh")
}
