#!/usr/bin/env bash

menuOptions=""
activeState="disable"
NEWLINE="\n"

# get name
output_names=$(swaymsg -t get_outputs | jq -r '.[].name')
selected_name=$(echo "$output_names" | wofi --show=dmenu)

if [ -z "$selected_name" ]; then
    echo "no selected name"
    exit
fi

isActive=$(swaymsg -t get_outputs | jq -r --arg option "$selected_name" '.[] | select(.name == $option)' | jq -r '.active')
if test $isActive = "false"
then
    activeState="enable"
fi
menuOptions="resolutions\n${activeState}\n"

choosen=$(echo -e $menuOptions | wofi -i --dmenu)

if test $choosen = "resolutions"
then

    resOptions=""
    resolutions=$(swaymsg -t get_outputs | jq -r --arg option "$selected_name" '.[] | select(.name == $option)' | jq -r '.modes')

    items=$(echo $resolutions | jq -c -r '.[]')
    for option in ${items[@]}; do
        height=$(echo "$option" | jq -r '.height')
        width=$(echo "$option" | jq -r '.width')

        refresh=$(echo "$option" | jq -r '.refresh')
        refresh=$(jq -n "$refresh/1000")

        resOptions+="${width}x${height}@${refresh}Hz${NEWLINE}"
    done

    selected_resolution=$(echo -e $resOptions | wofi -i --dmenu)
    sway output "${selected_name} mode ${selected_resolution}"

    exit 0

fi

# else enable or disable the display
sway output "${selected_name} ${activeState}"

