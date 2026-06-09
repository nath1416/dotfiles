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

updateColors(){
    local img=""
    img="$(getImage)"
    [[ -z $img ]] && return

    mime=$(file --brief --mime-type "$img")

    case "$mime" in
        image/jpeg) ext=jpg ;;
        image/png)  ext=png ;;
        image/webp) ext=webp ;;
        image/gif)  ext=gif ;;
        *) echo "$mime" && exit 1 ;;
    esac

    local link=""
    link="/tmp/image.$ext"
    printf "Creating link: %s -> %s" "$img" "$link"
    ln -sf "$img" "$link"
}

sendNotif(){
    local image
    local data
    
    image="$(getImage)"
    data="$(getData)"
    [[ -z $img ]] && notify-send -r "$msgTag" "$data"

    notify-send -i "$image" -r "$msgTag" "$data"
}

playMedia(){
    playerctl play-pause
    sendNotif
}

stopMedia(){
    playerctl stop
}

nextMedia(){
    playerctl next
    sleep 2
    sendNotif
}
previousMedia(){
    playerctl previous
    sleep 2
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
    echo "  dataImageProof"
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
        stop)   
            stopMedia
        ;;
        next)
            nextMedia
        ;;
        previous)
            previousMedia 
        ;;
        matugenMediaPlayer)
           updateColors 
           ;;
         *)
            helpMan
        ;;
    esac
}

main "$@"
