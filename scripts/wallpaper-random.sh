#!/bin/bash

# Random wallpaper picker
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# Get random wallpaper
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \) | shuf -n 1)

if [ -n "$WALLPAPER" ]; then
    echo "Setting wallpaper: $(basename "$WALLPAPER")"
    
    # Set wallpaper with nice transition
    swww img "$WALLPAPER" \
        --transition-type wave \
        --transition-pos 0.8,0.9 \
        --transition-step 90 \
        --transition-duration 2
    
    # Generate colors with wallust
    wallust run "$WALLPAPER"
    
    # Reload waybar to apply new colors
    killall -SIGUSR2 waybar
else
    echo "No wallpapers found in $WALLPAPER_DIR"
fi