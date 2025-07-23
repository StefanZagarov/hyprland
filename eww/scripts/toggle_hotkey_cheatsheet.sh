#!/bin/bash
# Hyprland Hotkeys → JSON (stdout) & toggle overlay
EWW_WINDOW="keybinds_overlay"
CONFIG_FILE="$HOME/.config/hypr/config/hotkeys.conf"

[[ -f $CONFIG_FILE ]] || { notify-send "Keybinds" "Config not found"; exit 1; }

if eww active-windows | grep -q "$EWW_WINDOW"; then
    eww close "$EWW_WINDOW"
else
    # Build JSON with grouped structure
    sed -n '/^[[:space:]]*bind.*# DESC:/p' "$CONFIG_FILE" |
    awk -v OFS=',' '
    BEGIN { print "["; first_group=1 }
    {
        # ... same key extraction logic as before ...

        match($0,/# DESC:[[:space:]]*([^\n]*)/,m); desc=m[1]
        if(match(desc,/^([^:]+):[[:space:]]*(.+)/,parts)){group=parts[1]; text=parts[2]}
        else{group="Miscellaneous"; text=desc}

        # Store items by group
        if (!(group in groups)) {
            groups[group] = ""
            group_order[++group_count] = group
        }
        groups[group] = groups[group] sprintf("{\"key\":%s,\"desc\":%s},", json(binding), json(text))
    }
    END {
        # Output grouped structure
        for (i=1; i<=group_count; i++) {
            group = group_order[i]
            items = groups[group]
            sub(/,$/, "", items)  # Remove trailing comma
            
            if (!first_group) printf ","
            first_group = 0
            
            printf "{\"group\":%s,\"items\":[%s]}", json(group), items
        }
        print "]"
    }
    function json(s){
        gsub(/\\/,"\\\\",s); gsub(/"/,"\\\"",s); return "\"" s "\""
    }' |
    eww update keybinds-items="$(cat)"

    eww open "$EWW_WINDOW"
fi