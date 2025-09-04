#!/usr/bin/env sh

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
    applyWallpaper "$wallpaper" "$FileName"

}

applyWallpaper(){
    if [ -n "$1" ]; then
        hyprctl hyprpaper reload , "$1" 
        hellwal --skip-term-colors --check-contrast -i "$1"
        dunstify "Changed Wallpaper to $2"
    else
        printf "Missing argument\n"
    fi
}
main(){

case $1 in
    hellpaper)
       hellpaperWallpaper 
    ;;
    set)
        sleep 2
        applyWallpaper "$2"
    ;;
    *)
    exit 0
    ;;
esac
}

main "$@"
