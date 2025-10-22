#! /usr/bin/env sh

set -e

msgTag="3"

changeVolume() {
    change="$1"
    wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ "$change"
    currentVolume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
    dunstify -a "d" -u low  -i change-volume -r "$msgTag" -h int:value:"$(echo "$currentVolume" | awk -F. '{ print $2 }')" "$currentVolume"
}

muteSpeaker() {
    wpctl set-mute @DEFAULT_SINK@ toggle
    if wpctl get-volume @DEFAULT_SINK@ | grep MUTED; then
        dunstify -r "5" "Default Sink muted"
        brightnessctl -d platform::mute s 100%
    else 
        dunstify  -r "5" "Default Sink unmuted"
        brightnessctl -d platform::mute s 0%
    fi
}

muteMic(){
    wpctl set-mute @DEFAULT_SOURCE@ toggle
    if wpctl get-volume @DEFAULT_SOURCE@ | grep MUTED; then
        dunstify  -r "5" "Default Source muted"
        brightnessctl -d platform::micmute s 100%
    else 
        dunstify  -r "5" "Default Source unmuted"
        brightnessctl -d platform::micmute s 0%
    fi
}

main() {
case $1 in
    muteSpeaker)
        muteSpeaker
    ;;
    muteMic)
        muteMic
    ;;
    change)
        changeVolume "$2"
    ;;
    *)
        exit 1
    ;;
esac
}

main "$@"
