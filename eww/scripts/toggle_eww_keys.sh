#!/bin/bash

# Path to your hotkeys configuration file
CONFIG_FILE="$HOME/Arch/Hyprland/hypr/config/hotkeys.conf"

# Parse the config file and generate a JSON array for eww
get_keybinds() {
    # Use awk to parse the file, looking for lines with a description comment
    awk -F, '
    /# DESC:/ {
        # Reconstruct the keybinding from the first two parts
        key_combo = $1 ", " $2
        # Remove the "bind... =" part
        sub(/.*= */, "", key_combo)
        # Replace variable with actual key name for display
        gsub(/\$mainMod/, "SUPER", key_combo)
        # Clean up whitespace
        gsub(/^[ \t]+|[ \t]+$/, "", key_combo)

        # Extract the description from the comment
        desc_part = $0
        sub(/.*# DESC:/, "", desc_part)
        gsub(/^[ \t]+|[ \t]+$/, "", desc_part)

        # Print in a format that can be easily converted to JSON
        print key_combo "@@@" desc_part
    }
    ' "$CONFIG_FILE" | \
    jq -R -s '
        split("\n") | .[:-1] | map(
            split("@@@") | {key: .[0], desc: .[1]}
        )
    '
}

# Update eww variable and toggle the window
eww update keybinds-lines="$(get_keybinds)"
eww open --toggle keybinds_overlay