#!/usr/bin/env bash

direction="$1"

yabai -m space --display "$direction" && yabai -m display --focus "$direction"
