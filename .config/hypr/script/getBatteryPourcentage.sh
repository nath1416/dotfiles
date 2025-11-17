#! /usr/bin/env bash

set -e 

upowerResult=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0)


state=$(echo "$upowerResult" | grep state | awk '{print $2}')

state_icon=""

if [[ "$state" == "pending-charge" ]]; then
    state_icon=" "
fi

if [[ "$state" == "charging" ]]; then
    state_icon="󱐋"
fi

if [[ "$state" == "discharging" ]]; then
    state_icon="󰶹"
fi

pourcentage=$(echo "$upowerResult" | grep perce | awk '{print $2}')
number=${pourcentage%\%}

battery_icon="󰂃"

if   (( number <= 15 )); then
    battery_icon="󰁺"
elif (( number <= 25 )); then
    battery_icon="󰁻"
elif (( number <= 35 )); then
    battery_icon="󰁼"
elif (( number <= 45 )); then
    battery_icon="󰁽"
elif (( number <= 55 )); then
    battery_icon="󰁿"
elif (( number <= 65 )); then
    battery_icon="󰂀"
elif (( number <= 75 )); then
    battery_icon="󰂁"
else
    battery_icon="󰁹"
fi

echo "$pourcentage $battery_icon $state_icon"
