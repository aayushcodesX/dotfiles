#!/usr/bin/env bash

# Function to print media status with clickable Polybar format tags
print_status() {
    STATUS=$(playerctl status 2>/dev/null)
    
    if [ "$STATUS" = "Playing" ]; then
        ICON="󰏤" # Pause icon
    elif [ "$STATUS" = "Paused" ]; then
        ICON="󰐊" # Play icon
    else
        echo "" # Hide when no player is active
        return
    fi

    ARTIST=$(playerctl metadata artist 2>/dev/null)
    TITLE=$(playerctl metadata title 2>/dev/null)
    
    # Truncate title if too long
    TEXT="$ARTIST - $TITLE"
    if [ ${#TEXT} -gt 35 ]; then
        TEXT="${TEXT:0:32}..."
    fi

    # Polybar formatting: Prev | Play/Pause | Next | Track Info
    echo "%{A1:playerctl previous:}󰒮%{A}  %{A1:playerctl play-pause:}%{F#89b4fa}$ICON%{F-}%{A}  %{A1:playerctl next:}󰒭%{A}   %{A1:playerctl play-pause:}$TEXT%{A}"
}

# Print once on startup
print_status

# Listen for D-Bus events with 0% idle CPU
playerctl metadata --format "{{status}}" --follow 2>/dev/null | while read -r _; do
    print_status
done
