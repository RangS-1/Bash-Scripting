#!/bin/bash

echo "========================"
echo "| Linux System Monitor |"
echo "========================"
echo ""

get_ram(){

    printf "RAM Used: " && free -h | grep Mem | awk '{print $3}'
}

get_disk(){
    printf "Disk Used: " && df -h / | awk 'NR==2 {print $5}'
}

get_battery(){
    printf "Battery: $(cat /sys/class/power_supply/BAT1/capacity)%%"
}

get_network(){
    NET_STATUS=$(nmcli networking connectivity)
    if [[ "$NET_STATUS" == "full" ]]; then
        echo ""
        printf "Network: Connected"
    else
        echo ""
        printf "Network: Not Connected"
    fi
}

get_ip(){
    echo ""
    printf "Your IP: "
    printf "$(ip address)" | grep "scope global" | awk '{print $2}'
}

get_uptime(){
    printf "Uptime: " && uptime -p | awk '{print $2, $3, $4, $5}'
}

get_ram
get_disk
get_battery
get_network
get_ip
get_uptime