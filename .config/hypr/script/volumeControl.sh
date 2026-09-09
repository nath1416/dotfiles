#! /usr/bin/env bash

set -e

msgTag="3"

getPlayingStream() {
    local player
    local stream

    player="$(playerctl -a metadata --format '{{playerName}}|{{status}}' 2>/dev/null | awk -F'|' '$2 == "Playing" { print $1; exit }')"
    [[ -z "$player" ]] && return 1

    stream="$(pw-dump | jq -r --arg player "$player" '
        .[]
        | select(.type == "PipeWire:Interface:Node")
        | select(.info.props["media.class"] == "Stream/Output/Audio")
        | select(.info.state == "running")
        | select((.info.props["application.name"] // "" | ascii_downcase) == ($player | ascii_downcase))
        | .id
    ' | head -n 1)"
    [[ -n "$stream" ]] && printf "%s\n" "$stream"

    [[ -n "$stream" ]]
}

getAudioTarget() {
    local target
    target="$(getPlayingStream || true)"
    printf "%s\n" "${target:-@DEFAULT_AUDIO_SINK@}"
}

changeVolume() {
    local change
    local currentVolume
    local audioTarget

    change="$1"
    audioTarget="$(getAudioTarget)"
    wpctl set-volume -l 1 "$audioTarget" "$change"
    currentVolume=$(wpctl get-volume "$audioTarget")
    notify-send -a "d" -u low -i change-volume -r "$msgTag" -h int:value:"$(echo "$currentVolume" | awk -F. '{ print $2 }')" "$currentVolume"
}

setLigth() {
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
    local audioTarget

    audioTarget="$(getAudioTarget)"
    set +e
    if ! wpctl set-mute "$audioTarget" toggle; then
        notify-send -r "5" "Set mute default sink errored"
        exit 1
    fi
    set -e

    if wpctl get-volume "$audioTarget" | grep MUTED; then
        notify-send -r "5" "Audio muted"
    else
        notify-send -r "5" "Audio unmuted"
    fi
}

muteMic() {
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

getVolumeSink() {
    local volumeSink=""
    volumeSink="$(wpctl get-volume "$(getAudioTarget)" | awk -F. '{ print $2 }')"

    printf "%S" "$volumeSink"
    printf "\n"
}

helpMan() {
    printf "Args:\n"
    printf "\tmuteSpeaker\n"
    printf "\tmuteMic\n"
    printf "\tchange ARGS: +5,-5\n"
    printf "\tupdateLigths\n"
    printf "\tgetVolume\n"
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
