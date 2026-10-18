#!/bin/bash
kill -9 $(yabai -m query --windows --window | jq '.pid')
