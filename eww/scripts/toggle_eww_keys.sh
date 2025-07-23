#!/bin/bash

# Path to your hotkeys configuration file
CONFIG_FILE="$HOME/Arch/Hyprland/hypr/config/hotkeys.conf"

if [[ ! -f "$CONFIG_FILE" ]]; then
    echo "Config file not found: $CONFIG_FILE" >&2
    exit 1
fi

# Parse the config file and generate a JSON array for eww
get_keybinds() {
    awk -F'# DESC: ' '
        /bind.*# DESC:/ {
            desc=$2
            sub(/^[ \t]*bind[ \t]*=[ \t]*/, "", $1)
            key_part=$1
            split(key_part, arr, ",")
            keys_only=arr[1] " + " arr[2]
            gsub(/\$mainMod/, "SUPER", keys_only)
            gsub(/[ \t]+/, " ", keys_only)
            print keys_only "@@@" desc
        }
    ' "$CONFIG_FILE" | jq -R -s '
        split("\n") | .[:-1] | map(
            split("@@@") | {key: .[0], desc: .[1]}
        )
    '
}

# Update eww variable and toggle the window
eww update keybinds-lines="$(get_keybinds)"
eww open --toggle keybinds_overlay
