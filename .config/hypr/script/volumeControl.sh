#! /bin/sh


msgTag="3"

main() {

    change="$1"
    wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ $change
    currentVolume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
    dunstify -a "d" -u low  -i change-volume -r "$msgTag" -h int:value:$(echo "$currentVolume" | awk -F. '{ print $2 }') " $(echo $currentVolume | awk -F. '{ print $2 }') %"
}

main $@
