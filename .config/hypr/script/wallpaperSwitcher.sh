#!/usr/bin/env bash

WALLPAPER_PATH=/home/nathan/wallpapers

SAVE_PATH_WALLPAPER=/home/nathan/.config/hypr/wallpaper.txt

hyprlockWallpaperPath=/home/nathan/.cache/hyprlock/wallPaper

DEFAULT_KITTY_OPACITY=0.80

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

    if [ -n "$1" ]; then
        local BaseName="$(basename "$1")"
        local FileName="${BaseName%.*}"
        echo "$1" > $SAVE_PATH_WALLPAPER

        awww img --transition-bezier .71,.4,1,.73 --transition-pos top-right --transition-duration 1 --transition-type grow --transition-fps 60 "$1"
        sleep 0.8
        hellwal --skip-term-colors  --check-contrast -i "$1"
        dunstify -r "4" "Changed Wallpaper to $FileName"
    else
        printf "Missing argument\n"
    fi
}

setHyprlockWallpaper(){
    ln -fs "$1" $hyprlockWallpaperPath
}

startKitten(){
    killKitten

    kitten panel --detach --edge=background --margin-top=-1 --focus-policy=not-allowed "$1"

    kitty @ set-background-opacity "$DEFAULT_KITTY_OPACITY"
}

killKitten(){
    pkill -f '/usr/bin/kitty \+kitten panel' || true
}

activeMonitor(){
    local monitor="$(hyprctl activeworkspace -j | jq '.monitor')"
    echo "$monitor"
}

getRandom(){
    local Wallpaper=$(find "$WALLPAPER_PATH" -type f | shuf -n 1)
    echo "$Wallpaper"
}



setRandom(){
    applyWallpaper "$(getRandom)"
    setHyprlockWallpaper "$(getRandom)"
}



help(){
    printf "Unknow argument: %s\n" "$1"
    printf "%s [Argument]\n" "$0"
    printf "Argument: \n"
    printf "\t hellpaper\n"
    printf "\t set\n"
    printf "\t set-once\n"
    printf "\t set-random\n"
    printf "\t kitten <program>\n"
    printf "\t kill-kitten\n"
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
    get-random)
        echo "$(getRandom)"
    ;;
    set-random)
        setRandom
    ;;
    kitten) 
        startKitten "$2"
    ;;
    kill-kitten) 
        killKitten
    ;;
    *)
        help "$@"
    ;;
esac
}

main "$@"
