#! /usr/bin/env bash


set -e

chooseFileName(){
    name=$(wofi --color ~/.cache/hellwal/wofi.colors  -c "$HOME/.config/wofi/custom/screenshot.config" --show dmenu)
    if [[ "$name" == "" ]]; then
        exit
    fi
    fileName="${name}-$(date +'%F')-arch.png"
    echo "$fileName"
}

sendNotif(){
    notify-send "$1"
}

fullScreen(){
    name=$(chooseFileName)
    sleep 1
    mkdir -p "$(xdg-user-dir PICTURES)/screenShots"
    grim "$(xdg-user-dir PICTURES)/screenShots/$name"
    sendNotif "ScreenShot: $name"
}

selectScreen(){
    size=$(slurp -w 2)
    name=$(chooseFileName)
    sleep 1
    mkdir -p "$(xdg-user-dir PICTURES)/screenShots"
    grim -g "$size" "$(xdg-user-dir PICTURES)/screenShots/$name"
    sendNotif "ScreenShot ($size): $name"
}


main (){
    choice="$1"
    case $choice in
        -f) 
            fullScreen
            ;;
        -s)
            selectScreen
            ;;
        *)
            exit 0
            ;;
        esac
}

main "$@"
