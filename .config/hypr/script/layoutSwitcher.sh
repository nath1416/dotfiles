#! /usr/bin/env bash

set -e 

SAVE_PATH_LAYOUT=/home/nathan/.config/hypr/layout.txt

MSG_TAG="73"


get_layout(){
    local layout=""
    layout="$(hyprctl getoption general:layout -j | jq -r '.str')"
    echo "$layout"
}

save_layout(){
    local layout=""
    layout="$(get_layout)"
    echo "$layout" > "$SAVE_PATH_LAYOUT"
}

load_layout(){
    if [ ! -f "$SAVE_PATH_LAYOUT" ]; then 
       send_notif "No save file"
       return
    fi

    read -r loadedLayout < "$SAVE_PATH_LAYOUT"

	[[ -z "$1" ]] && return
    set_layout "$loadedLayout"
}

send_notif(){
	[[ -z "$1" ]] && return
    notify-send -r "$MSG_TAG" "$1"
}

set_layout(){
    local newLayout="" 
    newLayout="$1"
	[[ -z "$newLayout" ]] && return
    
    local output=""
    output="$(hyprctl eval "hl.config({ general = { layout = \"$newLayout\" } })")"

    local currentLayout=""
    currentLayout="$(get_layout)"

    send_notif """Set layout to: $currentLayout 
Hyprctl returned: $output"""

}

next_state() {
    local current=""
    local states=""

    # states=("dwindle" "monocle" "master" "scrolling")
    states=("dwindle" "scrolling")

    current="$1"

    for i in "${!states[@]}"; do
        if [[ "${states[$i]}" == "$current" ]]; then
            local next_index=$(( (i + 1) % ${#states[@]} ))
            echo "${states[$next_index]}"
            return
        fi
    done

    echo "${states[0]}"
}

cycle_layout(){

    local currentLayout
    currentLayout="$(get_layout)"

    local nextLayout
    newLayout="$(next_state $currentLayout)"

    set_layout "$newLayout"
}


get_layout_icon(){
    local layout=""
    layout="$(get_layout)"
    echo "$layout"
}

helpMan(){
    printf "Args to program :\n"
    printf "\tset\n"
    printf "\tget\n"
    printf "\tget-icon\n"
    printf "\tnext\n"
}
main(){
   case "$1" in
         set)
             set_layout "$2"
         ;;
        get)
            get_layout
        ;;
        get-icon)
            get_layout_icon
        ;;
        next)
           cycle_layout 
         ;;
         *)
            helpMan
        ;;
    esac
}

main "$@"

printf "Current layout: %s\n" "$(get_layout)"
printf "Args: %s\n" "$@"
