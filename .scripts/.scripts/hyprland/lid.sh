#!/usr/bin/env sh
if grep -q open /proc/acpi/button/lid/LID0/state; then
    if [ "$(acpi -a)" == "Adapter 0: on-line" ]; then
        hyprctl keyword monitor eDP-1,enable
    fi
else
    hyprctl keyword monitor eDP-1,disable
fi

