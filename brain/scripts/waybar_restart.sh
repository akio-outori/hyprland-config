#!/bin/bash
# AGS Restart Script
# This script kills and restarts the AGS bar

echo "Restarting AGS bar..."

# Kill existing AGS processes
killall -9 ags 2>/dev/null
killall -9 gjs 2>/dev/null

# Wait a moment for clean shutdown
sleep 0.5

# Start AGS
cd ~/.config/ags && ags run app.ts --gtk 3 &

echo "AGS restarted!"
