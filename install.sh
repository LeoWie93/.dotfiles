#!/bin/env bash

STOW_FOLDERS=(
    "aliases"
    "dunst"
    "nvim"
    "starship"
    ".scripts"
    "swappy"
    "sway"
    "swaylock"
    "tmux"
    "themes"
    "waybar"
    "wezterm"
    "zsh"
)

# Loop through the array and handle each string
for folder in "${STOW_FOLDERS[@]}"
do
  # Handle the string here
  echo "Stow folder: $folder"
  stow -R $folder
done

