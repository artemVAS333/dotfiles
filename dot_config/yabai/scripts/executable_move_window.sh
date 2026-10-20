#!/usr/bin/env bash

direction="$1"

is_floating=$(yabai -m query --windows --window | jq '(.["is-floating"] == true)')

if [ "$is_floating" = "true" ]; then
    case "$direction" in
        west) yabai -m window --move rel:-20:0 ;;
        east) yabai -m window --move rel:20:0  ;;
        north) yabai -m window --move rel:0:-20 ;;
        south) yabai -m window --move rel:0:20  ;;
    esac
else
    yabai -m window --warp "$direction" || \
    (yabai -m window --display "$direction" && yabai -m display --focus "$direction")
fi
