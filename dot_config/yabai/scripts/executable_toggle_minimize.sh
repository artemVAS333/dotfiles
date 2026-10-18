#!/bin/bash
if yabai -m query --windows --window &>/dev/null; then
    yabai -m window --minimize
else
    win_id=$(yabai -m query --windows | jq '[.[] | select(.["is-minimized"] == true)] | last | .id')
    if [ -n "$win_id" ] && [ "$win_id" != "null" ]; then
        yabai -m window --deminimize "$win_id"
        yabai -m window --focus "$win_id"
    fi
fi
