#!/bin/bash

echo "🔗 Removing symlinks from ~/.config..."
# This removes the 'shortcuts' without deleting your actual repo files yet
rm -f ~/.config/sway
rm -f ~/.config/waybar
rm -f ~/.config/wofi
rm -f ~/.config/mako
rm -f ~/.config/fish

read -p "⚠️ Do you want to delete the cloned repo too? (y/N): " delete_repo
if [[ "$delete_repo" =~ ^[Yy]$ ]]; then
    echo "🗑️ Deleting repo files..."
    rm -rf $HOME/dotfiles/src/
    echo "✅ Everything is gone."
else
    echo "✅ Symlinks removed, but your repo files are still in $HOME/dotfiles/src/"
fi
