#!/bin/sh

WALL_DIR="/home/war/Pictures/Desktop_Wallpapers"
CONFIG="$HOME/.config/hypr/hyprpaper.conf"

# Find a random image
WALLPAPER=$(find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | shuf -n1)

if [ -z "$WALLPAPER" ]; then
    echo "No wallpapers found in $WALL_DIR" >&2
    exit 1
fi

# Get monitor names using hyprctl + jq
if ! command -v jq >/dev/null; then
    echo "Error: 'jq' is required to parse monitor info." >&2
    exit 1
fi

# Build config: preload once, then one wallpaper line per monitor
{
    echo "preload = $WALLPAPER"
    hyprctl monitors -j | jq -r '.[].name' | while IFS= read -r mon; do
        echo "wallpaper = $mon,$WALLPAPER"
    done
    echo "unload = true"
} > "$CONFIG"

# Launch hyprpaper
hyprpaper
