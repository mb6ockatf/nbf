#!/usr/bin/env bash
###############################################################################
# refactor *.c files recirsively in the current folder
# original files are renamed into oldname.orig
# output: formatted c files
# requires `artistic style` to be installed
###############################################################################
refactor::c() {
	astyle --version &> /dev/null
	if [ "$?" == 127 ]; then
		local message
		message=$(color::form_output red "Please install astyle formatter: ")
		message+=$(color::form_output blue https://astyle.sourceforge.net/)
		echo -e "$message"
		return 127
	else
		astyle -rv \
		--style=linux \
		--indent=force-tab=4 \
		--delete-empty-lines\
		--break-closing-braces \
		--max-code-length=80 \
		--lineend=linux \
		--ascii \
		"*.c"
	fi
}
