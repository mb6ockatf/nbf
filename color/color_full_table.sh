#!/usr/bin/env bash

###############################################################################
# print full colorful table (may require much resources for rendering)
# output: colors table
###############################################################################
color::colorful() {
	for x in {0..8}; do 
    	for fg in {30..37}; do 
        	for bg in {40..47}; do 
            	echo -ne "\e[$x;$fg;$bg""m\\\e[$x;$fg;$bg""m\e[0;37;40m "
        	done
        	echo
    	done
	done
	echo ""
}