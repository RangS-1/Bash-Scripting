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

#get_cpu(){
#    printf "CPU Used: " && top | awk '{print $10}'
#}
#
#get_battery(){
#
#}
#
#get_network(){
#
#}
#
#get_ip(){
#
#}
#
#get_update(){
#
#}

get_ram
get_disk
#get_cpu