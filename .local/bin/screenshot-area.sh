
mkdir -p ~/Pictures/Screenshots
f=~/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png
grim -g "$(slurp)" "$f" && wl-copy < "$f" && notify-send "Screenshot" "Area saved and copied to clipboard"
