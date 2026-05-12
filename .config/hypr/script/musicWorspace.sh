#! /usr/bin/env bash

set -e 

LAUNCHER=/usr/bin/app2unit

WORKSPACE_NAME="music"
APP_NAME="music.apple.com"

createWorkSpace(){
    hyprctl dispatch "hl.dsp.focus({ workspace = \"name:$WORKSPACE_NAME\" })"
}

isMusicOpen(){
    hyprctl -j clients | jq -e --arg app "$APP_NAME" 'any(.[]; .class | contains($app))'
}

openMusic(){
    $LAUNCHER chromium --app="https://$APP_NAME" --password-store=basic & 
}

isInMusicWorSpace(){
    hyprctl -j activeworkspace | jq -e --arg ws "$WORKSPACE_NAME" '.name == $ws'
}

previousWorkSpace(){
    hyprctl dispatch 'hl.dsp.focus({ workspace = "previous_per_monitor" })'
}

main(){

    if isInMusicWorSpace; then
        previousWorkSpace
        exit 0
    fi

    createWorkSpace

    if ! isMusicOpen; then
        openMusic
    fi
}

main "$@"
