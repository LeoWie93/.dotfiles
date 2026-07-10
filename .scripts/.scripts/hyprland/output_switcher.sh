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

isDisabled=$(hyprctl monitors all -j | jq -r --arg option "$selected_name" '.[]' | jq -r '.disabled')
if test $isDisabled = "false"
then
    menuOptions="resolutions\ndisable\n"
else
    menuOptions="resolutions\n"
fi

choosen=$(echo -e $menuOptions | wofi -i --dmenu)

if test $choosen = "resolutions"; then
    resOptions=""
    resolutions=$(hyprctl monitors all -j | jq -r --arg option "$selected_name" '.[]' | jq -r '.availableModes')

    items=$(echo $resolutions | jq -c -r '.[]')
    for option in ${items[@]}; do
        echo $option
        resOptions+="${option}${NEWLINE}"
    done

    selected_resolution=$(echo -e $resOptions | wofi -i --dmenu)
    hyprctl eval "hl.monitor({output = \"${selected_name}\", mode = ${selected_resolution},,scale = 1.5})"

    exit 0
elif test "$choosen" = "disable"; then
    hyprctl eval "hl.monitor({output = \"${selected_name}\",mode = \"disable\"})"
fi

