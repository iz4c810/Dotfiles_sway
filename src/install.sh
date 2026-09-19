#!/bin/bash
sudo pacman -S starship git fastfetch cava sway swayfx wofi waybar fish btop

mkdir -p $HOME/dotfiles/src/clone

git clone https://github.com/iz4c810/Dotfiles_sway $HOME/dotfiles/src/clone/

# User can finish the rest for now, or i can, idk
