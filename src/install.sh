#!/bin/bash

# --- CORE INSTALLATION (Non-negotiable) ---
echo "📦 Installing core components (SwayFX, Waybar, etc.)..."
sudo pacman -S --needed swayfx waybar wofi mako swww brightnessctl wireplumber ttf-jetbrains-mono-nerd

# --- OPTIONAL SECTION ---
install_optional() {
    read -p "❓ Do you want to install $1? (y/N): " choice
    if [[ "$choice" =~ ^[Yy]$ ]]; then
        sudo pacman -S --needed $2
    fi
}

echo "✨ Optional Components:"
install_optional "Fish Shell" "fish"
install_optional "Starship Prompt" "starship"
install_optional "Fastfetch (System Info)" "fastfetch"
install_optional "Cava (Audio Visualizer)" "cava"
install_optional "Btop (System Monitor)" "btop"
install_optional "Screenshot Tools (Grim/Slurp)" "grim slurp"

# --- SYMLINKING ---
# (Your logic from before to link the configs)


# 2. Setup directory
CLONE_DIR="$HOME/dotfiles/src/clone"
mkdir -p "$CLONE_DIR"

# 3. Clone the repo (if not already there)
if [ ! -d "$CLONE_DIR/.git" ]; then
    echo "📥 Cloning dotfiles..."
    git clone https://github.com/iz4c810/Dotfiles_sway "$CLONE_DIR"
else
    echo "🔄 Repo already exists, pulling updates..."
    cd "$CLONE_DIR" && git pull
fi

# 4. Create Symlinks
echo "🔗 Creating symlinks..."
mkdir -p ~/.config

# Function to safely link folders
link_config() {
    if [ -d "$CLONE_DIR/$1" ]; then
        ln -sf "$CLONE_DIR/$1" ~/.config/
        echo "✅ Linked $1"
    else
        echo "⏭️ Skipping $1 (not found in repo)"
    fi
}

link_config "sway"
link_config "waybar"
link_config "wofi"
link_config "mako"
link_config "fish"
link_config "cava" # Added this since you have it as an option!

echo "✅ Setup complete! Log out and select SwayFX to see the magic."
