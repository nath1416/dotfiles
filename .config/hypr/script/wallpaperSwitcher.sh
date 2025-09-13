#!/usr/bin/env bash

WALLPAPER_PATH=/home/nathan/wallpapers

set -e

hellpaperWallpaper() {
 if [ -n "$(pidof hellpaper)" ]; then
    printf "hellpaper already launched\n"
    exit 0
fi

   wallpaper="$(hellpaper $WALLPAPER_PATH)"

    BaseName="$(basename "$wallpaper")"
    FileName="${BaseName%.*}"
    printf "WallPaper seleced: %s\n" "$wallpaper"
    applyWallpaper "$wallpaper" "$FileName"  "${1//\"/}"

}

applyWallpaper(){
    if [ -n "$1" ]; then
        hyprctl hyprpaper reload "$3, $1" 
        hellwal --skip-term-colors --check-contrast -i "$1"
        dunstify "Changed Wallpaper to $2"
    else
        printf "Missing argument\n"
    fi
}

activeMonitor(){
    monitor="$(hyprctl activeworkspace -j | jq '.monitor')"
    echo "$monitor"
}

help(){
    printf "Unknow argument: %s\n" "$1"
    printf "%s [Argument]\n" "$0"
    printf "Argument: \n"
    printf "\t hellpaper\n"
    printf "\t set\n"
    printf "\t set-once\n"
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
    set-once)
        sleep 1
        applyWallpaper "$2"
    ;;
    *)
        help "$@"
    ;;
esac
}

main "$@"
