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
    set +e
    if ! wpctl set-mute @DEFAULT_SINK@ toggle; then
        notify-send -r "5" "Set mute default sink errored"
        exit 1
    fi
    set -e

    if wpctl get-volume @DEFAULT_SINK@ | grep MUTED; then
        notify-send -r "5" "Default Sink muted"
    else 
        notify-send  -r "5" "Default Sink unmuted"
    fi
}

muteMic(){
    set +e
    if ! wpctl set-mute @DEFAULT_SOURCE@ toggle; then
        notify-send -r "5" "Set mute default source errored"
        exit 1
    fi
    set -e

    if wpctl get-volume @DEFAULT_SOURCE@ | grep MUTED; then
        notify-send -r "5" "Default Source muted"
    else 
        notify-send -r "5" "Default Source unmuted"
    fi
}


getVolumeSink(){
    local volumeSink=""
    volumeSink="$(wpctl get-volume @DEFAULT_SINK@)"

    printf "V: %s" "$volumeSink"
    printf "\n"
}

helpMan(){
    printf "Args:\n"
    printf "muteSpeaker\n"
    printf "muteMic\n"
    printf "change ARGS: +5,-5\n"
    printf "updateLigths\n"
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
    getVolume)
        getVolumeSink
    ;;
    *)
        helpMan
        exit 1
    ;;
esac
}

main "$@"
