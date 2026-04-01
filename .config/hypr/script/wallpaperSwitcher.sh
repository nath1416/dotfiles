#!/usr/bin/env bash

set -e

WALLPAPER_PATH=/home/nathan/wallpapers

SAVE_PATH_WALLPAPER=/home/nathan/.config/hypr/wallpaper.txt

hyprlockWallpaperPath=/home/nathan/.cache/hyprlock/wallPaper

DEFAULT_KITTY_OPACITY=0.80


hellpaperWallpaper() {
    if [ -n "$(pidof hellpaper)" ]; then
        printf "hellpaper already launched\n"
        exit 0
    fi

    local wallpaper

    wallpaper="$(hellpaper $WALLPAPER_PATH)"
    printf "WallPaper seleced: %s\n" "$wallpaper"
    applyWallpaper "$wallpaper" "${1//\"/}"

}

applyWallpaper(){

    if [ -n "$1" ]; then

        local RealPath
        RealPath="$(realpath $1)"
        echo "$RealPath" > "$SAVE_PATH_WALLPAPER"

        setHyprlockWallpaper "$RealPath"

        awww img --transition-bezier .71,.4,1,.73 --transition-pos top-right --transition-duration 1 --transition-type wipe --transition-fps 60 "$RealPath"
        sleep 0.8
        hellwal --skip-term-colors  --check-contrast -i "$RealPath"
        swaync-client -rs

        local BaseName
        local FileName
        BaseName="$(basename "$1")"
        FileName="${BaseName%.*}"
        notify-send -r "4" "Changed Wallpaper to $FileName"
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
    local monitor
    monitor="$(hyprctl activeworkspace -j | jq '.monitor')"
    echo "$monitor"
}

getRandom(){
    local wallpaper
    wallpaper=$(find "$WALLPAPER_PATH" -type f | shuf -n 1)
    echo "$wallpaper"
}



setRandom(){
    local path
    path="$(getRandom)"
    applyWallpaper "$path"
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

case "$1" in
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
