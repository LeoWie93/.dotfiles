#!/usr/bin/env bash

declare -a options
options+=("2560x1440@60Hz")
options+=("2560x1440@120Hz")

# Get the output names using swaymsg
output_names=$(swaymsg -t get_outputs | jq -r '.[].name')
selected_name=$(echo "$output_names" | wofi --show=dmenu)

if [ -z "$selected_name" ]; then
    exit
fi

output_info=$(swaymsg -t get_outputs | jq -r --arg output "$selected_name" '.[] | select(.name == $output)')
resolutions=$(echo "$output_info" | jq -c '.modes[]')

IFS=$'\n'  # Set Internal Field Separator to newline to handle items with spaces
for option in $resolutions; do
    height=$(echo "$option" | jq -r '.height')
    width=$(echo "$option" | jq -r '.width')

    refresh=$(echo "$option" | jq -r '.refresh')
    refresh=$(jq -n "$refresh/1000")

    options+=("$width"x"$height"@"$refresh")
done

selected_resolution=$(echo "$options" | wofi --show=dmenu)

sway output "$selected_name"" mode ""$selected_resolution""Hz"

