#! /usr/bin/env bash

set -e 

sendNotif(){
    notify-send -r "9" -t 1000 -a "brightnessctl" -h int:value:"$1" "Brightness: $1%"
}

increaseBrightness(){
    local current
    current=$(brightnessctl -m -e4 -n2 set 5%+ | sed -n 's/.*,\([0-9]\+\)%,.*/\1/p')
    sendNotif "$current"
}

decreaseBrightness(){
    local current
    current=$(brightnessctl -m -e4 -n2 set 5%- | sed -n 's/.*,\([0-9]\+\)%,.*/\1/p')
    sendNotif "$current"
}

main(){
case "$1" in
    increase)
        increaseBrightness 
    ;;
    decrease)
        decreaseBrightness
    ;;
    *)
        exit 1
    ;;
esac
}

main "$@"
