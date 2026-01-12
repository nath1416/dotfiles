#!/usr/bin/env bash


getCurrentMode(){
   cat /sys/firmware/acpi/platform_profile
}

balancedMode(){
    echo " "
}

performanceMode(){
    echo "󰠠 "
}

low-powerMode(){
    echo "󱤊 "
}
unknowMode(){
    printf "Unknow: $1"
}


getIconMode(){
    case "$1" in
        balanced)
            balancedMode
        ;;
        performance)
            performanceMode
        ;;
        low-power)
            low-powerMode
        ;;
        *)
            unknowMode "$mode"
    esac
}


main(){

    mode="$(getCurrentMode)" 

    case "$1" in
        mode)
            output=$(getIconMode "$mode")
            printf "$output\n"
        ;;
            
    esac

}

main "$@"


