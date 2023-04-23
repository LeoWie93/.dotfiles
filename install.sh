#!/bin/env bash

STOW_FOLDERS=("tmux" "zsh" "aliases" "rofi" "nvim")

# Loop through the array and handle each string
for folder in "${STOW_FOLDERS[@]}"
do
  # Handle the string here
  echo "Stow folder: $folder"
  stow -R $folder
done

