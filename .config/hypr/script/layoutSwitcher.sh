#! /usr/bin/env bash

set -e 

MSG_TAG="73"


get_layout(){
    # Gives the most popular layout, only one value
    local layout=""
#    layout="$(hyprctl workspaces -j | jq -r '.[].tiledLayout' | sort | uniq -c | sort -nr | head -1 | awk '{print $2}')"
    layout="$(hyprctl getoption general:layout -j | jq -r '.str')"

    echo "$layout"
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
    output="$(hyprctl keyword general:layout $newLayout)"

    local currentLayout=""
    currentLayout="$(get_layout)"

    send_notif """Set layout to: $currentLayout 
Hyprctl returned: $output"""
}



next_state() {
    local current=""
    local states=""

    #states=("dwindle" "monocle" "master" "scrolling")
    states=("dwindle" "scrolling")

    current="$1"

    for i in "${!states[@]}"; do
        if [[ "${states[$i]}" == "$current" ]]; then
            local next_index=$(( (i + 1) % ${#states[@]} ))
            echo "${states[$next_index]}"
            return
        fi
    done

    # fallback if not found
    echo "${states[0]}"
}

cycle_layout(){

    local currentLayout=""
    currentLayout="$(get_layout)"

    local nextLayout=""
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
             set_layout $2
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

printf "Current layout: $(get_layout)\n"
printf "Args: $@\n"
