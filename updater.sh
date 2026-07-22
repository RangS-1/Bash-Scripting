#!/bin/bash

echo "=============================="
echo " Arch Linux System Updater"
echo "=============================="

check_internet(){
    if ping -c 1 ping.archlinux.org >/dev/null 2>&1; then
        echo "-------------"
        echo "| Connected |"
        echo "-------------"
    else
        echo "----------------"
        echo "| Disconnected |"
        echo "----------------"
        exit 1
    fi
}

update_system(){
    sudo pacman -Syu && echo "System Update Success!"
}

update_aur(){
    yay -Syu && echo "AUR Update Success!"
}

clean_cache(){
    read -p "Do you want to clear cache?(Y/n) " CLEAR
    if [[ "$CLEAR" == "Y" || "$CLEAR" == "y" ]]; then
        echo "Cleaning cache..."
        sudo paccache -r -u -k 1 && sudo paccache -r -k 
    elif [[ "$CLEAR" == "N" || "$CLEAR" == "n" ]]; then
        echo "Skip."
    else
        echo "Invalid input."
    fi
}

check_internet
update_system
update_aur
clean_cache