#!/usr/bin/env bash

# have n profiles defined to choose from

declare -A profiles

profiles["default"]="ouput eDP-1 2880x1800@90Hz 1.2"
profiles["exo-alw"]="ouput eDP-1 2880x1800@90Hz 1.2"


# give them to wofi and show to user
# get input and apply profile
