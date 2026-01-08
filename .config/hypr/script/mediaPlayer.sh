#! /usr/bin/env bash


havePlayer(){
    playerctl status >/dev/null 2>&1
    return $?
}

getImage(){
    if ! havePlayer; then
        exit 0
    else
        img="$(playerctl metadata mpris:artUrl | sed 's|^file://||')"
        echo "$img"
    fi
}

getPosition(){
    if ! havePlayer; then
        exit 0
    else
        pos=$(playerctl position 2>/dev/null)
        pos=${pos%.*}

        printf "%02d:%02d\n" $((pos/60)) $((pos%60))
    fi
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
    if ! havePlayer; then
        exit 0
    else
        album="$(playerctl metadata album)"
        artist="$(playerctl metadata artist)"
        title="$(playerctl metadata title)"
        pos="$(getPosition)"
        icon="$(getPlayingIcon)"
        echo "$title - $icon $pos"
    fi
}


main(){
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
         *)
            helpMan
        ;;
    esac
}

main "$@"
