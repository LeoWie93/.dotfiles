#!/usr/bin/env bash

menuOptions=""
NEWLINE="\n"

# get name
output_names=$(hyprctl monitors all -j | jq -r '.[].name')
selected_name=$(echo "$output_names" | wofi --show=dmenu)

if [ -z "$selected_name" ]; then
    echo "no selected name"
    exit
fi

isDisabled=$(hyprctl monitors all -j | jq -r --arg option "$selected_name" '.[] | select(.name == $option)' | jq -r '.disabled')
if test $isDisabled = "false"
then
    menuOptions="resolutions\ndisable\n"
else
    menuOptions="resolutions\n"
fi

choosen=$(echo -e $menuOptions | wofi -i --dmenu)

if test $choosen = "resolutions"; then
    resOptions=""
    resolutions=$(hyprctl monitors all -j | jq -r --arg option "$selected_name" '.[] | select(.name == $option)' | jq -r '.availableModes')

    items=$(echo $resolutions | jq -c -r '.[]')
    for option in ${items[@]}; do
        echo $option
        resOptions+="${option}${NEWLINE}"
    done

    selected_resolution=$(echo -e $resOptions | wofi -i --dmenu)
    hyprctl keyword monitor "${selected_name}, ${selected_resolution},,1"

    exit 0
elif test "$choosen" = "disable"; then
    hyprctl keyword monitor "${selected_name},disable"
fi

