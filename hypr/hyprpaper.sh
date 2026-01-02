#!/bin/sh

WALL_DIR="$HOME/Pictures/Desktop_Wallpapers"
CONFIG="$HOME/.config/hypr/hyprpaper.conf"

# Find a random image
WALLPAPER=$(find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | shuf -n1)

if [ -z "$WALLPAPER" ]; then
    echo "No wallpapers found in $WALL_DIR" >&2
    exit 1
fi

# Check for required commands
if ! command -v jq >/dev/null; then
    echo "Error: 'jq' is required to parse monitor info." >&2
    exit 1
fi

if ! command -v hyprctl >/dev/null; then
    echo "Error: 'hyprctl' not found. Are you running Hyprland?" >&2
    exit 1
fi

# Get monitor list and validate
MONITORS=$(hyprctl monitors -j 2>/dev/null | jq -r '.[].name' 2>/dev/null)

if [ -z "$MONITORS" ]; then
    echo "Error: Could not get monitor list from hyprctl" >&2
    exit 1
fi

# --- START OF NEW CONFIG GENERATION ---
# Build config with new block syntax
{
    echo "ipc = true"
    echo ""

    # Iterate over monitors and create a block for each
    echo "$MONITORS" | while IFS= read -r mon; do
        if [ -n "$mon" ]; then
            echo "wallpaper {"
            echo "    monitor = $mon"
            echo "    path = $WALLPAPER"
            echo "    fit_mode = cover"
            echo "}"
            echo ""
        fi
    done
} > "$CONFIG"
# --- END OF NEW CONFIG GENERATION ---

# Validate config was created
if [ ! -s "$CONFIG" ]; then
    echo "Error: Failed to create hyprpaper config at $CONFIG" >&2
    exit 1
fi

# Kill existing instance to ensure the new config is read, then start fresh
killall hyprpaper 2>/dev/null
exec hyprpaper
