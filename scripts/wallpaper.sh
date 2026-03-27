#!/bin/bash
WALLPAPER="$1"
swww img "$WALLPAPER" --transition-type wave --transition-pos 0.8,0.9 --transition-step 90

# Generate colors with wallust
wallust run "$WALLPAPER"

# Reload waybar with new colors
killall -SIGUSR2 waybar