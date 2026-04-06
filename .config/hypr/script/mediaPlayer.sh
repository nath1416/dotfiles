#! /usr/bin/env bash

set -e 

msgTag="19"

havePlayer(){
    playerctl status >/dev/null 2>&1
    return $?
}

getImage(){
    local img
    img="$(playerctl metadata mpris:artUrl | sed 's|^file://||')"
    echo "$img"
}

getPosition(){
    local pos
    pos=$(playerctl position 2>/dev/null)
    pos=${pos%.*}

    printf "%02d:%02d\n" $((pos/60)) $((pos%60))
}

getPlayingIcon(){
    local state
    state="$(playerctl status)"
    case "$state" in 
        Playing)
            printf "󰏤"
        ;;
        Paused)
            printf ""
        ;;
        *)
            printf "Unknow: %s" "$state"
        ;;
    esac
}

getData(){
    local album
    local artist
    local title
    local pos
    local icon

    album="$(playerctl metadata album)"
    artist="$(playerctl metadata artist)"
    title="$(playerctl metadata title)"
    pos="$(getPosition)"
    icon="$(getPlayingIcon)"
    echo "$title - $icon $pos"
}
getDataImage(){

    local img=""
    img="$(getImage)"
    [[ -z $img ]] && return
    local album
    local artist
    local title
    local pos
    local icon

    album="$(playerctl metadata album)"
    artist="$(playerctl metadata artist)"
    title="$(playerctl metadata title)"
    pos="$(getPosition)"
    icon="$(getPlayingIcon)"
    echo "$title - $icon $pos"
}


sendNotif(){
    local image
    local data
    
    image="$(getImage)"
    data="$(getData)"
    notify-send -i "$image" -r "$msgTag" "$data"
}

playMedia(){
    playerctl play-pause
    sendNotif
}

nextMedia(){
    playerctl next
    sleep 1
    sendNotif
}
previousMedia(){
    playerctl previous
    sleep 1
    sendNotif
}

helpMan(){
    echo "Playerctf wrapper script"
    echo ""
    echo "Arguments:"
    echo "  image"
    echo "  data"
    echo "  position"
    echo "  getPlayingIcon"
    echo ""
    echo "With notifications:"
    echo "  play-pause"
    echo "  next"
    echo "  previous"
}

main(){
   if ! havePlayer; then
       exit 0
   fi 

   case "$1" in
       image)
           getImage
        ;;
        data)
            getData
        ;;
        dataImageProof)
            getDataImage
        ;;
        position)
            getPosition
        ;;
        getPlayingIcon)
            getPlayingIcon
        ;;
        play-pause)
            playMedia 
        ;;
        next)
            nextMedia
        ;;
        previous)
            previousMedia 
        ;;
         *)
            helpMan
        ;;
    esac
}

main "$@"
