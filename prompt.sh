#!/usr/bin/env bash

###############################################################################
# create colorful bash prompt message
# to actually implement this bash prompt, do:
#	export PROMPT_COMMAND=set_bash_prompt
# no arguments required
# output: sets PS1 value
###############################################################################
set_bash_prompt() {
	LAST_RESULT=$?
	DIVIDER="\[\e[30;1m\]"
	COLOR_CMDCOUNT="\[\e[32;1m\]"    # green bold
	COLOR_USERNAME="\[\e[37;0m\]"    # white
	COLOR_USERHOSTAT="\[\e[36;1m\]"  # lightblueb
	COLOR_HOSTNAME="\[\e[35;1m\]"    # purple bold
	COLOR_GITBRANCH="\[\e[33;0m\]"   # yellow
	COLOR_VENV="\[\e[33;1m\]"        # yellow bold
	COLOR_PATH_OK="\[\e[32;1m\]"     # green bold
	COLOR_PATH_ERR="\[\e[31;1m\]"    # red bold
	COLOR_NONE="\[\e[0m\]"           # end
	if [ $LAST_RESULT -eq 0 ]; then
		PATH_COLOR="$COLOR_PATH_OK"
	else
		PATH_COLOR="$COLOR_PATH_ERR"
	fi
	PS1="\n${DIVIDER}"
	PS1="${PS1}[${PATH_COLOR}\w${DIVIDER}"
	PS1="${PS1}:${COLOR_CMDCOUNT}\#${DIVIDER}"
	GIT_IS_AVAILABLE=$(git --version 2>&1 >/dev/null ; echo $?)
	if [ "$GIT_IS_AVAILABLE" -eq 0 ]; then
		git_answer=$(git rev-parse --is-inside-work-tree 2>&1 >/dev/null)
		if [ "$git_answer" = "" ]; then
			GIT_BRANCH=$(git symbolic-ref --short HEAD)
			PS1="${PS1}:${COLOR_GITBRANCH}${GIT_BRANCH}${DIVIDER}"
		fi
	fi
	if [ -n "$VIRTUAL_ENV" ]; then
		PS1="${PS1}:${COLOR_VENV}$(basename \""$VIRTUAL_ENV"\")${DIVIDER}"
	fi
	PS1="${PS1}]"
	PS1+="\n[${DIVIDER}"
	PS1+="${COLOR_USERNAME}\u${COLOR_USERHOSTAT}"
	PS1+="@${COLOR_HOSTNAME}\h${DIVIDER}]"
	PS1+="${COLOR_NONE} "
}