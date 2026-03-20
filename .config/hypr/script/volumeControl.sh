#! /usr/bin/env bash

set -e

msgTag="3"

changeVolume() {
    local change
    local currentVolume

    change="$1"
    wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ "$change"
    currentVolume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
    notify-send -a "d" -u low  -i change-volume -r "$msgTag" -h int:value:"$(echo "$currentVolume" | awk -F. '{ print $2 }')" "$currentVolume"
}

setLigth(){
    if wpctl get-volume @DEFAULT_SINK@ | grep MUTED; then
        brightnessctl -d platform::mute s 100%
    else 
        brightnessctl -d platform::mute s 0%
    fi

    if wpctl get-volume @DEFAULT_SOURCE@ | grep MUTED; then
        brightnessctl -d platform::micmute s 100%
    else 
        brightnessctl -d platform::micmute s 0%
    fi
}
muteSpeaker() {
    wpctl set-mute @DEFAULT_SINK@ toggle
    if wpctl get-volume @DEFAULT_SINK@ | grep MUTED; then
        notify-send -r "5" "Default Sink muted"
    else 
        notify-send  -r "5" "Default Sink unmuted"
    fi
}

muteMic(){
    wpctl set-mute @DEFAULT_SOURCE@ toggle
    if wpctl get-volume @DEFAULT_SOURCE@ | grep MUTED; then
        notify-send   -r "5" "Default Source muted"
    else 
        notify-send   -r "5" "Default Source unmuted"
    fi
}

main() {
case "$1" in
    muteSpeaker)
        muteSpeaker
        setLigth
    ;;
    muteMic)
        muteMic
        setLigth
    ;;
    change)
        changeVolume "$2"
    ;;
    updateLigths)
        setLigth
    ;;
    *)
        exit 1
    ;;
esac
}

main "$@"
