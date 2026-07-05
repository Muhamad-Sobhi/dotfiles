
mkdir -p ~/Pictures/Screenshots
f=~/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png
grim "$f" && wl-copy < "$f" && notify-send "Screenshot" "Saved and copied to clipboard"
