#!/bin/bash
EWW_WINDOW="keybinds_overlay"
CONFIG_DIR="$HOME/.config/hypr/config"
CONFIG_FILES=("$CONFIG_DIR"/hotkeys-*.conf)

[[ ${#CONFIG_FILES[@]} -gt 0 ]] || { notify-send "Keybinds" "No hotkey configs found"; exit 1; }

if eww active-windows | grep -q "$EWW_WINDOW"; then
    eww close "$EWW_WINDOW"
else
    # Process config and build grouped JSON
    cat "${CONFIG_FILES[@]}" | sed -n '/^[[:space:]]*bind.*# DESC:/p' |
    awk '
    BEGIN {
        print "[";
        group_count = 0;
        delete groups;
        delete group_order;
    }
    {
        # Extract binding part
        core = $0;
        sub(/[[:space:]]*#.*$/, "", core);  # Remove comment
        sub(/^[[:space:]]*bind[^=]*=[[:space:]]*/, "", core);  # Remove bind prefix
        
        # Split core into components
        split(core, parts, /,[[:space:]]*/);
        mods = parts[1];
        key = parts[2];
        
        # Clean and format modifiers and key
        gsub(/[[:space:]]+/, " ", mods);  # Normalize spaces
        gsub(/^ | $/, "", mods);          # Trim spaces
        gsub(/ $/, "", key);               # Trim trailing space
        gsub(/\$mainMod/, "SUPER", mods);  # Replace mainMod
        
        # Combine modifiers and key
        if (mods != "") binding = mods "+" key;
        else binding = key;
        gsub(/ /, "+", binding);           # Replace spaces with +

        # Extract description
        match($0, /# DESC:[[:space:]]*([^\n]+)/, desc_match);
        full_desc = desc_match[1];
        
        # Split into group and description
        if (match(full_desc, /^([^:]+):[[:space:]]*(.+)/, group_match)) {
            group = group_match[1];
            description = group_match[2];
        } else {
            group = "Miscellaneous";
            description = full_desc;
        }

        # Add to group structure
        if (!(group in groups)) {
            groups[group] = "";
            group_order[++group_count] = group;
        }
        groups[group] = groups[group] sprintf("{\"key\":\"%s\",\"desc\":\"%s\"},", binding, description);
    }
    END {
        # Output grouped JSON
        for (i = 1; i <= group_count; i++) {
            group = group_order[i];
            items = groups[group];
            sub(/,$/, "", items);  # Remove trailing comma
            
            if (i > 1) printf ",";
            printf "{\"group\":\"%s\",\"items\":[%s]}", group, items;
        }
        print "]";
    }' | 
    eww update keybinds-items="$(cat)"

    eww open "$EWW_WINDOW"
fi
