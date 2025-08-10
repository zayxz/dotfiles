#!/bin/bash

WALLPAPER=$(find "/home/zaddy/Pictures/wallpapers/" -type f | shuf -n 1)
hyprctl hyprpaper preload "$WALLPAPER"
hyprctl hyprpaper wallpaper "DP-2,$WALLPAPER"
