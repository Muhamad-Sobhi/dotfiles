#!/bin/bash
TERM_CLASS="scratchpad"
WID=$(xdotool search --class "$TERM_CLASS" 2>/dev/null | head -1)

if [ -z "$WID" ]; then
    foot --app-id "$TERM_CLASS" &
else
    if xdotool getactivewindow | grep -q "$WID"; then
        xdotool windowminimize "$WID"
    else
        xdotool windowraise "$WID"
        xdotool windowfocus "$WID"
    fi
fi
