#!/usr/bin/env sh

# do we still need this file for hyperland?
if grep -q open /proc/acpi/button/lid/LID0/state; then
    hyprctl keyword monitor eDP-1,enable
else
    if [ "$(acpi -a)" == "Adapter 0: on-line" ]; then
        hyprctl keyword monitor eDP-1,disable
    fi
fi

