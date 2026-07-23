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

clean_cache(){
    read -p "Do you want to clear cache?(Y/n) " CLEAR
    if [[ "$CLEAR" == "Y" || "$CLEAR" == "y" ]]; then
        echo "[!] Cleaning cache..."
        sudo paccache -r -u -k 1 && sudo paccache -r -k 2
    elif [[ "$CLEAR" == "N" || "$CLEAR" == "n" ]]; then
        echo "Aight, "
    else
        echo "Invalid input."
    fi
}

clean_journal(){
    read -p "[!] Do you want to clear journal?(Y/n) " JOURNAL
    if [[ "$JOURNAL" == "Y" || "$JOURNAL" == "y" ]]; then
        echo "[!] Cleaning journal..."
        sudo journalctl --vacuum-time=7d || grep "Vacuuming done"
    elif [[ "$JOURNAL" == "N" || "$JOURNAL" == "n" ]]; then
        echo "[!] Aight."
        show_menu
    else
        echo "[!] Invalid input."
        clean_journal
    fi
}

check_disk(){
    printf "[✓] Disk Used : " && df -h / | awk 'NR==2 {print $5}'
    sleep 2
}

show_menu(){
    echo "================="
    echo "== Maintenance =="
    echo "================="
    check_network
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
        "3")
            clean_cache
            show_menu
            ;;
        "4")
            clean_journal
            show_menu
            ;;
        "6")
            check_disk
            show_menu
            ;;
        "7")
            clear
            show_menu
            ;;
        "8")
            echo
            echo "[✓] OK! See Ya!"
            exit 1
            ;;
        *)
            show_menu
            ;;
    esac
}

show_menu

