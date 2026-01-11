#!/usr/bin/env bash
set -uo pipefail

# 1. Capture output
mapfile -t lines < <(hyprctl dispatch hy3:debugnodes)

# 2. Logic Variables
line_count=${#lines[@]}
is_crash_state=false

# 3. Fuzzy Check
if [[ $line_count -eq 2 ]]; then
    line1="${lines[0]}"
    line2="${lines[1]}"

    if [[ "$line1" == *"group"* && "$line1" == *"[tabs]"* ]]; then
        if [[ "$line2" == *"window"* ]]; then
            is_crash_state=true
        fi
    fi
fi

# 4. Execute
if [[ "$is_crash_state" == "true" ]]; then
    # Notify user we saved them
    # notify-send -t 2000 "Hy3" "Preventing untab crash..."

    # Safely remove the tab group
    hyprctl dispatch hy3:changegroup untab
else
    # Normal operation
    hyprctl dispatch hy3:makegroup tab,toggle,force_ephemeral
fi
