#! /usr/bin/env bash

set -e 

MSG_TAG="73"

get_layout(){
    # Gives the most popular layout, only one value
    local layout=""
    layout="$(hyprctl workspaces -j | jq -r '.[].tiledLayout' | sort | uniq -c | sort -nr | head -1 | awk '{print $2}')"

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


#states=("dwindle" "monocle" "master" "scrolling")
states=("dwindle" "scrolling")

next_state() {
    local current="$1"

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

main(){
   case "$1" in
         set)
             set_layout $2
         ;;
        get)
            get_layout
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

printf "Current layout: $(get_layout) "
printf "Args: $@"
