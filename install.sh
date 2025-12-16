#!/bin/bash

# Define colors for feedback
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_DIR="$HOME/.config"
HOME_DIR="$HOME"

# Array to track which files were processed so we can check for missing ones later
declare -a PROCESSED_FILES

echo "Symlinking files..."

link_file() {
    local src="$1"
    local dest="$2"
    local name=$(basename "$src")

    # Add to list of processed files
    PROCESSED_FILES+=("$name")

    mkdir -p "$(dirname "$dest")"

    # Remove destination if it exists (file, symlink, or directory)
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        rm -rf "$dest"
    fi

     # Link! 
    # -s = symbolic
    # -f = force (delete existing file/link at destination if it exists)
    # -n = no-dereference (useful if replacing a directory link)
    if ln -sfn "$src" "$dest"; then
        echo -e "${GREEN}[OK]${NC} Linked $src --> $dest"
    else
        echo -e "${RED}[FAIL]${NC} Error linking $src"
    fi
}

sudo_link_file() {
    local src="$1"
    local dest="$2"
    local name=$(basename "$src")

    PROCESSED_FILES+=("$name")

    sudo mkdir -p "$(dirname "$dest")"
    
    # Remove destination if it exists (file, symlink, or directory)
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        sudo rm -rf "$dest"
    fi
    
    if sudo ln -sfn "$src" "$dest"; then
        echo -e "${GREEN}[OK]${NC} Linked $src --> $dest"
    else
        echo -e "${RED}[FAIL]${NC} Error linking $src"
    fi
}

echo "Linking standard config files..."

declare -a CONFIG_FOLDERS=(
    "alacritty"
    "eww"
    "hypr"
    "nvim"
    "rofi"
    "swaync"
    "yazi"
    "zathura"
)

for folder in "${CONFIG_FOLDERS[@]}"; do
    link_file "$REPO_DIR/$folder" "$CONFIG_DIR/$folder"
done

declare -a HOME_FILES=(
    ".bashrc"
    ".bash_profile"
)

echo "Symlinking home files..."

for file in "${HOME_FILES[@]}"; do
    link_file "$REPO_DIR/$file" "$HOME_DIR/$file"
done

echo "Symlinking custom files..."

# Binaries
link_file "$REPO_DIR/bin" "$HOME/.local/bin"

# GTK
link_file "$REPO_DIR/gtk-3.0" "$CONFIG_DIR/gtk-3.0"
link_file "$REPO_DIR/gtk-4.0" "$CONFIG_DIR/gtk-4.0"

# Portals
link_file "$REPO_DIR/portals.conf" "$CONFIG_DIR/xdg-desktop-portal/portals.conf"

link_file "$REPO_DIR/override.conf" "$CONFIG_DIR/systemd/user/xdg-desktop-portal-gtk.service.d/override.conf"

echo "Symlinking keyd..."

sudo_link_file "$REPO_DIR/keyd" "/etc/keyd"

echo "Creating local configuration files (if they don't exist)..."

# Create hypr/config/local.conf if it doesn't exist
if [ ! -f "$REPO_DIR/hypr/config/local.conf" ]; then
    cat > "$REPO_DIR/hypr/config/local.conf" << 'EOF'

EOF
    echo -e "${GREEN}[OK]${NC} Created $REPO_DIR/hypr/config/local.conf"
else
    echo -e "${GREEN}[OK]${NC} $REPO_DIR/hypr/config/local.conf already exists"
fi

# Create .bashrc.local if it doesn't exist
if [ ! -f "$REPO_DIR/.bashrc.local" ]; then
    cat > "$REPO_DIR/.bashrc.local" << 'EOF'

EOF
    echo -e "${GREEN}[OK]${NC} Created $REPO_DIR/.bashrc.local"
else
    echo -e "${GREEN}[OK]${NC} $REPO_DIR/.bashrc.local already exists"
fi

echo "------------------------------------------------"
echo "Checking for unlinked files in repo..."

# Final check: Loop through repo to see if we missed anything
found_unlinked=false

for item in "$REPO_DIR"/* "$REPO_DIR"/.*; do
    name=$(basename "$item")

    # Skip .git, current dir, parent dir, and the script itself
    if [[ "$name" == "." || "$name" == ".." || "$name" == ".git" || "$name" == ".gitignore" || "$name" == "install.sh" || "$name" == "README.md" || "$name" == "test.sh" ]]; then
        continue
    fi

    # Check if this item is in our PROCESSED_FILES array
    was_processed=false
    for p in "${PROCESSED_FILES[@]}"; do
        if [[ "$p" == "$name" ]]; then
            was_processed=true
            break
        fi
    done

    # If it wasn't processed, print RED
    if [ "$was_processed" = false ]; then
        echo -e "${RED}[UNLINKED]${NC} $name (Exists in repo but was not symlinked)"
        found_unlinked=true
    fi
done

if [ "$found_unlinked" = false ]; then
    echo -e "${GREEN}All repo files are successfully accounted for!${NC}"
fi

echo "Done!"
