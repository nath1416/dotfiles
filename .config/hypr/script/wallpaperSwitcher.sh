#!/usr/bin/env bash

WALLPAPER_PATH=/home/nathan/wallpapers

set -e

hellpaperWallpaper() {
    if [ -n "$(pidof hellpaper)" ]; then
        printf "hellpaper already launched\n"
        exit 0
    fi

    local Wallpaper="$(hellpaper $WALLPAPER_PATH)"
    printf "WallPaper seleced: %s\n" "$Wallpaper"
    applyWallpaper "$Wallpaper" "${1//\"/}"

}

applyWallpaper(){

    local BaseName="$(basename "$1")"
    local FileName="${BaseName%.*}"

    if [ -n "$1" ]; then
        swww img --transition-bezier 0.68,.31,.35,1.08 --transition-pos top-right --transition-duration 1 --transition-type grow --transition-fps 60 "$1"
        sleep 0.8
        #hyprctl hyprpaper reload "$2, $1" 
        hellwal --skip-term-colors --check-contrast -i "$1"
        dunstify -r "4" "Changed Wallpaper to $FileName"
    else
        printf "Missing argument\n"
    fi
}

activeMonitor(){
    local monitor="$(hyprctl activeworkspace -j | jq '.monitor')"
    echo "$monitor"
}

setRandom(){
    
    local Wallpaper=$(find "$WALLPAPER_PATH" -type f | shuf -n 1)

    applyWallpaper "$Wallpaper"
}

help(){
    printf "Unknow argument: %s\n" "$1"
    printf "%s [Argument]\n" "$0"
    printf "Argument: \n"
    printf "\t hellpaper\n"
    printf "\t set\n"
    printf "\t set-once\n"
    printf "\t set-random\n"
}

main(){

case $1 in
    hellpaper)
       hellpaperWallpaper 
    ;;
    hellpaperActiveMonitor)
        hellpaperWallpaper "$(activeMonitor)"
    ;;
    set)
        applyWallpaper "$2"
    ;;
    set-random)
        setRandom
    ;;
    *)
        help "$@"
    ;;
esac
}

main "$@"
