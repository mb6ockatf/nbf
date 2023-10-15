#!/usr/bin/env bash
###############################################################################
# the right way to update arch system
###############################################################################
pacman_upgrade() {
    if ! command -v pacman --version &> /dev/null; then
        echo "pacman aint working"
        exit 1
    fi
    sudo pacman -Syuu
    if ! command -v yay --version &> /dev/null; then
        echo "yay not working; continue"
    fi
    yay -Syuu
    if ! command -v paccache --version &> /dev/null; then
        echo "pacman_contrib not installed; so not cleaning cache"
        exit 0
    fi
    paccache -rk0
}