#!/usr/bin/env sh

WALLPAPER_PATH=/home/nathan/wallpapers

# Exit if already launched
if [ -n "$(pidof hellpaper)" ]; then
    printf "hellpaper already launched\n"
    exit 0
fi
WALLPAPER=$(hellpaper $WALLPAPER_PATH)
BASENAME=$(basename "$WALLPAPER")
FILENAME_WITHOUT_EXT="${BASENAME%.*}"

echo "Selected wallpaper: $WALLPAPER" 

if [ -n "$WALLPAPER" ]; then
    hyprctl hyprpaper reload , "$WALLPAPER" 
    hellwal --skip-term-colors --check-contrast -i "$WALLPAPER"
#    dunstify "Changed Wallpaper to $FILENAME_WITHOUT_EXT"
fi
