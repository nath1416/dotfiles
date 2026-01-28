#! /usr/bin/env sh

SERVICE_NAME=hypridle.service

logger "Starting idle Inhibitor script"


isRunning(){
    systemctl --user is-active --quiet "$SERVICE_NAME"
}

stopService(){
        logger "Stopping hypridle"
        systemctl --user stop "$SERVICE_NAME"
}

startService(){
   logger "Started hypridle"
   systemctl --user start "$SERVICE_NAME"
}

toggleService(){
    if isRunning; then
        stopService
    else
        startService
    fi
}

getIconStatus(){
    if isRunning; then
        echo "󰒲 "
    else
        echo " "
    fi
}

printHelp(){
    printf "help"
}



main(){
   case "$1" in
       getIcon)
           printf $(getIconStatus)
         ;;
        start)
            startService
        ;;
        stop)
            stopService
        ;;
        toggle)
         toggleService
         ;;
        *)
         printHelp
         ;;
    esac
}

main "$@"
