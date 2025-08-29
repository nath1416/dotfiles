#! /usr/bin/env sh

set -e 
pourcentage=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep perce | awk '{print $2}')

echo "$pourcentage 󰁹"

