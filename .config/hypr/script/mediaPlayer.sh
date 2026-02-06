#! /usr/bin/env bash


msgTag="19"

havePlayer(){
    playerctl status >/dev/null 2>&1
    return $?
}

getImage(){
    local img="$(playerctl metadata mpris:artUrl | sed 's|^file://||')"
    echo "$img"
}

getPosition(){
    local pos=$(playerctl position 2>/dev/null)
    local pos=${pos%.*}

    printf "%02d:%02d\n" $((pos/60)) $((pos%60))
}

getPlayingIcon(){
    local state="$(playerctl status)"
    case "$state" in 
        Playing)
            printf "󰏤"
        ;;
        Paused)
            printf ""
        ;;
        *)
            printf "Unknow: %s" $state
        ;;
    esac
}

getData(){
    local album="$(playerctl metadata album)"
    local artist="$(playerctl metadata artist)"
    local title="$(playerctl metadata title)"
    local pos="$(getPosition)"
    local icon="$(getPlayingIcon)"
    echo "$title - $icon $pos"
}

sendNotif(){
    local image="$(getImage)"
    local data="$(getData)"
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
