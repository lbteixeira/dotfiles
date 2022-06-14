#!/bin/bash

setxkbmap -option caps:ctrl_modifier &

picom &

nitrogen --restore &

xrandr --output "eDP-1" --off --output "HDMI-1" --auto --right-of "DP-1" --output "DP-1" --auto

blueman-tray &

pasystray &
