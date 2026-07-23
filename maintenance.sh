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
    echo "[7] Exit"
    read -p "Your Choice: " SELECT

    case "$SELECT" in
        "7")
            echo "[✓] OK! See Ya!"
            exit 1
            ;;
        *)
            show_menu
            ;;
    esac
}

show_menu

