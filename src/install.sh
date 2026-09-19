#!/bin/bash

# 1. Get the correct paths
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

echo "📦 Installing core components..."
sudo pacman -S --needed swayfx waybar wofi mako swww brightnessctl wireplumber ttf-jetbrains-mono-nerd

# 2. Optional Components
install_optional() {
    read -p "❓ Install $1? (y/N): " choice
    [[ "$choice" =~ ^[Yy]$ ]] && sudo pacman -S --needed $2
}

install_optional "Fish Shell" "fish"
install_optional "Starship" "starship"
install_optional "Fastfetch" "fastfetch"
install_optional "Cava" "cava"
install_optional "Screenshot Tools" "grim slurp"

# 3. Symlinking Logic
echo "🔗 Linking configs from $REPO_ROOT..."
mkdir -p ~/.config

link_it() {
    if [ -d "$REPO_ROOT/$1" ]; then
        ln -sf "$REPO_ROOT/$1" ~/.config/
        echo "✅ Linked $1"
    fi
}

link_it "sway"
link_it "waybar"
link_it "wofi"
link_it "mako"
link_it "fish"

echo "🚀 Done! Log out and choose SwayFX."
