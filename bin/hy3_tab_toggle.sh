#!/usr/bin/env bash
set -uo pipefail

# Capture current state
mapfile -t lines < <(hyprctl dispatch hy3:debugnodes)

# Regex definitions
re1='^group\(0x[0-9a-fA-F]+\) \[tabs\] size ratio: 1, ephemeral$'
re2='^\|-[[:space:]]*window\(0x[0-9a-fA-F]+\) \[hypr 0x[0-9a-fA-F]+\] size ratio: 1$'

# Check for the specific "crash" state (Exact 2 lines, matches regex)
is_crash_state=false
if [[ ${#lines[@]} -eq 2 ]]; then
    if [[ "${lines[0]}" =~ $re1 && "${lines[1]}" =~ $re2 ]]; then
        is_crash_state=true
    fi
fi

# Execute based on state
if [[ "$is_crash_state" == "true" ]]; then
    hyprctl dispatch hy3:changegroup untab
else
    hyprctl dispatch hy3:makegroup tab,toggle,force_ephemeral
fi
