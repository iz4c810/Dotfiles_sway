#!/bin/bash
# tweaks.sh - Experimental Hyprland Setup

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

echo "⚠️ WARNING: This Hyprland config is experimental and not officially supported!"
read -p "🤔 Do you still want to proceed? (y/N): " proceed

if [[ "$proceed" =~ ^[Yy]$ ]]; then
    echo "📦 Installing Hyprland dependencies..."
    sudo pacman -S --needed hyprland xdg-desktop-portal-hyprland qt5-wayland qt6-wayland

    echo "🔗 Linking Hyprland config..."
    ln -sf "$REPO_ROOT/hypr" ~/.config/
    
    echo "✨ Tweaks applied! You can now try logging into Hyprland."
else
    echo "❌ Aborted. Keeping it stable with Sway!"
fi
