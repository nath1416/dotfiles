#! /usr/bin/env bash

set -e

main() {

    capacity=$(</sys/class/power_supply/BAT0/capacity)
    status=$(</sys/class/power_supply/BAT0/status)

    case "$status" in
    Charging)
        state_icon="󱐋"
        ;;
    Discharging)
        state_icon="󰶹"
        ;;
    Full)
        ;;
    "Not charging")
        state_icon=""
        ;;
    *)
        state_icon="unknown: $status"
        ;;
    esac

    battery_icon="󰂃"

    if (( capacity <= 15 )); then
        battery_icon="󰁺"
    elif (( capacity <= 25 )); then
        battery_icon="󰁻"
    elif (( capacity <= 35 )); then
        battery_icon="󰁼"
    elif (( capacity <= 45 )); then
        battery_icon="󰁽"
    elif (( capacity <= 55 )); then
        battery_icon="󰁿"
    elif (( capacity <= 65 )); then
        battery_icon="󰂀"
    elif (( capacity <= 75 )); then
        battery_icon="󰂁"
    else
        battery_icon="󰁹"
    fi

    echo "${capacity}% $battery_icon $state_icon"
}

main "$@"
