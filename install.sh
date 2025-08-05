#!/usr/bin/env bash

STOW_FOLDERS=(
    "aliases"
    "bat"
    "dunst"
    "desktop_entries"
    "fastfetch"
    "ghostty"
    "gitconfig"
    "hypr"
    "nvim"
    "paru"
    "starship"
    ".scripts"
    "swappy"
    "sway"
    "swaylock"
    "tmux"
    "themes"
    "waybar"
    "wofi"
    "zsh"
)

# Loop through the array and handle each string
for folder in "${STOW_FOLDERS[@]}"
do
  # Handle the string here
  echo "Stow folder: $folder"
  stow -R $folder
done

