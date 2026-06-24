#!/usr/bin/env bash

#set -e

WALLPAPER_PATH="$HOME/wallpapers"

SAVE_PATH_WALLPAPER="$HOME/.config/hypr/wallpaper.txt"

DEFAULT_KITTY_OPACITY=0.80

verbose=0

applyWallpaper(){

    local wallpaperPath=""
    wallpaperPath="$1"

    local RealPath
    RealPath="$(realpath $1)"

    [[ "$verbose" -eq 1 ]] && printf "Checking if file exist: %s\n" "$RealPath"


    if [ ! -e "$RealPath" ]; then
        printf "Wallpaper not found\n" 
        exit 1
    fi
    echo "$RealPath" > "$SAVE_PATH_WALLPAPER"

    programWallpaper $RealPath
    
    [[ "$verbose" -eq 1 ]] && printf "Set Wallpaper to %s\n" "$RealPath"

    sleep 0.8

    setMatugen "$RealPath"

    set -e
    local BaseName
    local FileName
    BaseName="$(basename "$RealPath")"
    FileName="${BaseName%.*}"
    notify-send -r "4" "Changed Wallpaper to $FileName"

}

programWallpaper(){
    local wallpaperPath=""
    wallpaperPath="$1"

    awww img --transition-bezier .71,.4,1,.73 --transition-pos top-right --transition-duration 1 --transition-type wipe --transition-fps 60 "$wallpaperPath"
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

    local program=""
    program="$1"

    [[ -n "$program" ]] || { printf 'Program not set\n'; exit 1; }

    kitten panel --detach --edge=background --margin-top=-1 --focus-policy=not-allowed "$program" 
}

killKitten() {
    [[ "$verbose" -eq 1 ]] && printf 'Attempting to terminate existing kitty panel instances...\n'

    if pkill -f '/usr/bin/kitty \+kitten panel'; then
        [[ "$verbose" -eq 1 ]] && printf 'Successfully terminated one or more kitty panel instances.\n'
    else
        [[ "$verbose" -eq 1 ]] && printf 'No matching kitty panel instances were found.\n'
    fi
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
    local argument=""
    argument="$1"

    [[ "$argument"  ]] && printf "Unknow argument: %s\n\n" "$1"

    printf "%s (Flag) [Argument]\n" "$0"
    printf "Flags: \n"
    printf "\t -v (verbose)\n"
    printf "\t -h (help)\n"
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
        getRandom
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
