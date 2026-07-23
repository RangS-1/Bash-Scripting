#!/bin/bash

check_network(){
    NET_STATUS=$(nmcli networking connectivity)
    if [[ "$NET_STATUS" == "full" ]]; then
        echo ""
        printf "[✓] Internet Connected"
    else
        echo ""
        printf "[X] Internet Disconnected"
    fi
}

update_packages(){
    echo
    echo "[1] System Packages"
    echo "[2] AUR Packages"
    echo "[3] Back"
    read -p "Which one you want to update? " UPDATE

    if [[ "$UPDATE" == "1" ]]; then
        sudo pacman -Syu
    elif [[ "$UPDATE" == "2" ]]; then
        yay -Syu
    elif [[ "$UPDATE" == "3" ]]; then
        show_menu
    else
        update_packages
    fi
}

show_menu(){
    echo "================="
    echo "== Maintenance =="
    echo "================="
    echo
    echo "[!] Please select task!"
    echo
    echo "[1] Full Maintenance"
    echo "[2] Update Packages"
    echo "[3] Clean Cache"
    echo "[4] Clean Journal"
    echo "[5] Remove Old Downloads"
    echo "[6] Disk Usage"
    echo "[7] Clear Screen"
    echo "[8] Exit"
    read -p "[!] Your Choice: " SELECT

    case "$SELECT" in
        "2")
            update_packages
            show_menu
            ;;
        "7")
            clear
            show_menu
            ;;
        "8")
            echo "[✓] OK! See Ya!"
            exit 1
            ;;
        *)
            show_menu
            ;;
    esac
}

show_menu

