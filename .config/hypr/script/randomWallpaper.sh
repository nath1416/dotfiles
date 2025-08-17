#! /usr/bin/env sh

WALLPAPER_DIRECTORY=$HOME/wallpapers

WALLPAPER=$(find "$WALLPAPER_DIRECTORY" -type f | shuf -n 1)

hyprctl hyprpaper preload "$WALLPAPER"
hyprctl hyprpaper wallpaper "DP-2,$WALLPAPER"

sleep 1

hyprctl hyprpaper unload unused
