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

if   (( number <= 10 )); then
    battery_icon="󰁺"   # 0–10%
elif (( number <= 20 )); then
    battery_icon="󰁻"   # 11–20%
elif (( number <= 30 )); then
    battery_icon="󰁼"   # 21–30%
elif (( number <= 40 )); then
    battery_icon="󰁽"   # 31–40%
elif (( number <= 50 )); then
    battery_icon="󰁿"   # 41–50%
elif (( number <= 60 )); then
    battery_icon="󰂀"   # 51–60%
elif (( number <= 70 )); then
    battery_icon="󰂁"   # 61–70%
elif (( number <= 80 )); then
    battery_icon="󰁹"   # 71–80%
fi

echo "$pourcentage $battery_icon $state_icon"
