#!/bin/bash

WALLPAPER_DIR="/home/zaddy/Pictures/wallpapers/"
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Apply the selected wallpaper to the monitor
if [ -n "$WALLPAPER" ]; then
    MONITOR="DP-2"
    hyprctl hyprpaper preload "$WALLPAPER"
    hyprctl hyprpaper wallpaper "$MONITOR,$WALLPAPER"
fi
