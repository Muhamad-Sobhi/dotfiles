#!/bin/bash

LOCKSCREEN_WALLPAPER="$HOME/docs/wallpapers/old/SoftAndClean.png"
main_menu() {
    echo -e "Shutdown\nReboot\nSleep\nLogout\nLock\nCancel" | \
        rofi -dmenu -p "Power:" -theme ~/.config/rofi/themes/powermenu.rasi
}
pause_menu() {
    echo -e "now\n+60\n+45\n+30\n+15\n+10\n+5\n+3\n+2\n+1" | \
        rofi -dmenu -p "Delay:" -theme ~/.config/rofi/themes/powermenu.rasi
}
action=$(main_menu)
[ -z "$action" ] && exit

case "$action" in
    "Shutdown")
        pause=$(pause_menu)
        [ -z "$pause" ] && exit
        notify-send "System:" "Shutdown scheduled - $pause"
        doas shutdown -P "$pause"
        ;;
    "Reboot")
        pause=$(pause_menu)
        [ -z "$pause" ] && exit
        notify-send "System:" "Reboot scheduled - $pause"
        doas shutdown -r "$pause"
        ;;
    "Sleep")
        notify-send "System:" "Suspending now"
        doas systemctl suspend
        ;;
    "Logout")
        notify-send "System:" "Logging out..."
        sleep 1
        pkill -TERM dwl
        ;;
    "Lock")
        if [ -f "$LOCKSCREEN_WALLPAPER" ]; then
            swaylock --show-failed-attempts --color EEEEEE \
                --image "$LOCKSCREEN_WALLPAPER" --tiling &
        else
            swaylock --show-failed-attempts --color 000000 &
        fi
        ;;
    "Cancel")
        notify-send "System:" "Shutdown command cancelled"
        doas shutdown -c
        ;;
esac
