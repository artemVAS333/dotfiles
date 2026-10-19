#!/bin/bash
app="$1"
title="${2:-floating-term}"

KITTY_SOCKET="/tmp/mykitty"

if [ ! -S "$KITTY_SOCKET" ]; then
    KITTY_SOCKET=$(ls -t /tmp/kitty-* 2>/dev/null | head -n 1)
fi

if [ -n "$KITTY_SOCKET" ]; then
    kitty @ --to="unix:$KITTY_SOCKET" launch \
        --type=os-window \
        --title="$title" \
        $app
else
    /Applications/Kitty.app/Contents/MacOS/kitty \
        --title="$title" \
        --directory ~ \
        -e $app &
fi

sleep 0.1
yabai -m window --focus "$(yabai -m query --windows | jq -r --arg title "$title" '.[] | select(.title == $title) | .id' | head -n 1)"

