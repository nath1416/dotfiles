#! /usr/bin/env bash

set -e 

toggleBlueLight (){

}

main(){
    
case "$1" in
    toggleBlueLightFilter)
       toggleBlueLight 
    ;;
    decrease)
        decreaseBrightness
    ;;
    *)
        exit 1
    ;;
esac
}

main "$@"
