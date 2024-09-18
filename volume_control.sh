#!/bin/bash

case $1 in
    increase)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
        volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')
        notify-send "Volume Increased" "Current volume: ${volume}%"
        ;;
    decrease)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')
        notify-send "Volume Decreased" "Current volume: ${volume}%"
        ;;
    toggle)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o '[^ ]*$')
        if [ "$muted" = "[MUTED]" ]; then
            notify-send "Audio Muted"
        else
            volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')
            notify-send "Audio Unmuted" "Current volume: ${volume}%"
        fi
        ;;
    *)
        echo "Usage: $0 {increase|decrease|toggle}"
        exit 1
        ;;
esac
