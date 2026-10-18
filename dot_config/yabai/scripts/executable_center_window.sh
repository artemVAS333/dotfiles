#!/bin/bash
eval $(yabai -m query --displays --display | jq -r '.frame | "DS_W=\(.w) DS_H=\(.h) DS_X=\(.x) DS_Y=\(.y)"')
eval $(yabai -m query --windows --window | jq -r '.frame | "WIN_W=\(.w) WIN_H=\(.h)"')

x=$(awk -v ds_x="$DS_X" -v ds_w="$DS_W" -v win_w="$WIN_W" 'BEGIN {print int(ds_x + (ds_w - win_w) / 2)}')
y=$(awk -v ds_y="$DS_Y" -v ds_h="$DS_H" -v win_h="$WIN_H" 'BEGIN {print int(ds_y + (ds_h - win_h) / 2)}')

yabai -m window --move abs:$x:$y
