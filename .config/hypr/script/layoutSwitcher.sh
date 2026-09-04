#! /usr/bin/env bash

set -e 


MSG_TAG="73"


get_layout(){
    local layout=""
    layout="$(hyprctl repl 'hl.get_active_workspace().tiled_layout')"
    echo "$layout"
}

send_notif(){
	[[ -z "$1" ]] && return
    notify-send -r "$MSG_TAG" "$1"
}

get_layout_icon(){
    local layout=""
    declare -A layout_icons=(
        [dwindle]="󰾍"
        [scrolling]="" 
    )

    layout="$(get_layout)"
    echo "${layout_icons[$layout]:-$layout}"
}

helpMan(){
    printf "Args to program :\n"
    printf "\tget\n"
    printf "\tget-icon\n"
}
main(){
   case "$1" in
        get)
            get_layout
        ;;
        get-icon)
            get_layout_icon
        ;;
         *)
            helpMan
        ;;
    esac
}

main "$@"