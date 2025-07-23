#!/bin/bash
# Hyprland Hotkeys → JSON (stdout) & toggle overlay
EWW_WINDOW="keybinds_overlay"
CONFIG_FILE="$HOME/.config/hypr/config/hotkeys.conf"

[[ -f $CONFIG_FILE ]] || { notify-send "Keybinds" "Config not found"; exit 1; }

if eww active-windows | grep -q "$EWW_WINDOW"; then
    eww close "$EWW_WINDOW"
else
    # Build JSON and push it straight into the variable
    sed -n '/^[[:space:]]*bind.*# DESC:/p' "$CONFIG_FILE" |
    awk -v OFS=',' '
    {
        core=$0; sub(/[[:space:]]*#.*$/,"",core); sub(/^[[:space:]]*bind[^=]*=[[:space:]]*/,"",core)
        split(core,a,","); mod=a[1]; key=a[2]
        gsub(/[[:space:]]*/,"",mod); gsub(/[[:space:]]*/,"",key); gsub(/\$mainMod/,"SUPER",mod)
        binding=mod"+"key

        match($0,/# DESC:[[:space:]]*([^\n]*)/,m); desc=m[1]
        if(match(desc,/^([^:]+):[[:space:]]*(.+)/,parts)){group=parts[1]; text=parts[2]}
        else{group="Miscellaneous"; text=desc}

        if(!seen[group]++){printf "  {\"is_title\":true,\"text\":%s},\n",json(group)}
        printf "  {\"is_title\":false,\"key\":%s,\"desc\":%s},\n",json(binding),json(text)
    }
    function json(s){
        gsub(/\\/,"\\\\",s); gsub(/"/,"\\\"",s); return "\"" s "\""
    }' |
    sed '$ s/,$//' |
    { echo '['; cat; echo ']'; } |
    eww update keybinds-items="$(cat)"

    eww open "$EWW_WINDOW"
fi