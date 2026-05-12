#!/usr/bin/env bash

#set -e

WALLPAPER_PATH=/home/nathan/wallpapers

SAVE_PATH_WALLPAPER=/home/nathan/.config/hypr/wallpaper.txt

DEFAULT_KITTY_OPACITY=0.80

verbose=0

applyWallpaper(){

    if [ -n "$1" ]; then

        local RealPath
        RealPath="$(realpath $1)"
        echo "$RealPath" > "$SAVE_PATH_WALLPAPER"
        
        [[ "$verbose" -eq 1 ]] && printf "Set Wallpaper to %s\n" "$RealPath"

        awww img --transition-bezier .71,.4,1,.73 --transition-pos top-right --transition-duration 1 --transition-type wipe --transition-fps 60 "$RealPath"
        sleep 0.8

#        set +e

        setMatugen "$RealPath"
        set -e
        local BaseName
        local FileName
        BaseName="$(basename "$1")"
        FileName="${BaseName%.*}"
        notify-send -r "4" "Changed Wallpaper to $FileName"
    else
        printf "Missing argument\n"
    fi
}

setMatugen(){
    local path
    path="$1"

    [[ "$verbose" -eq 1 ]] && printf "Ran matugen with file: %s\n" "$path"
    if ! error_output=$(matugen image "$RealPath" --prefer darkness 2>&1); then
        notify-send -r 4 "Matugen Failed" "$error_output"
        echo "Matugen failed"
        exit
    fi
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

reloadWallpaper(){
    local lasWallpaper=""
    lasWallpaper=$(cat "$SAVE_PATH_WALLPAPER")

    applyWallpaper "$lasWallpaper"
}


help(){
    printf "Unknow argument: %s\n" "$1"
    printf "%s (Flag) [Argument]\n" "$0"
    printf "Flags: \n"
    printf "\t -v\n"
    printf "\t -h\n"
    printf "Argument: \n"
    printf "\t set\n"
    printf "\t reload\n"
    printf "\t set-random\n"
    printf "\t kitten <program>\n"
    printf "\t kill-kitten\n"
}


flag(){
while getopts ":vh" opt; do
    case "$opt" in
        v)
            verbose=1
            echo "Set vebose"
            ;;
        h)
            help
            exit
            ;;
        \?)
            echo "Unknown option: -$OPTARG"
            exit 1
            ;;
    esac
done
}

main(){

    flag "$@"
    shift $((OPTIND - 1))
case "$1" in
    set)
        applyWallpaper "$2"
    ;;
    reload)
        reloadWallpaper
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
