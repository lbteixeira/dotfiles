#!/bin/bash

setxkbmap -option caps:ctrl_modifier &
picom &
nitrogen --restore &
xrandr --output "eDP" --auto --right-of "HDMI-A-0" &

