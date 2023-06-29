#!/usr/bin/env bash
###############################################################################
# outputs "Pling" 3 is divisor of $1, "Plang" if 5 is divisor of $1, "Plong" if
# 7 is divisor of $1, else outputs $1
###############################################################################
pling_plang() {
    result=""
    if [ -n "$1" ]; then
        if ! (( $1 % 3 )); then
            result="$result""Pling"
        fi
        if ! (( $1 % 5 )); then
            result="$result""Plang"
        fi
        if ! (( $1 % 7 )); then
            result="$result""Plong"
        fi
        if [ -z "$result" ]; then
            result="$1"
        fi
    fi
    echo "$result"
}