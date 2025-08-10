#!/bin/bash
# See README.md for usage instructions
volume_step=5
max_volume=100
notification_timeout=1500 # in milliseconds
show_music_in_volume_indicator=true

# Uses regex to get volume from pactl
function get_volume {
    pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]{1,3}(?=%)' | head -1
}

# Uses regex to get mute status from pactl
function get_mute {
    pactl get-sink-mute @DEFAULT_SINK@ | grep -Po '(?<=Mute: )(yes|no)'
}

# Uses regex to get mic volume from pactl
function get_mic_volume {
    pactl get-source-volume @DEFAULT_SOURCE@ | grep -Po '[0-9]{1,3}(?=%)' | head -1
}

# Gets mic mute status
function get_mic_mute {
    pactl get-source-mute @DEFAULT_SOURCE@ | grep -Po '(?<=Mute: )(yes|no)'
}

# Returns a mute icon, a volume-low icon, or a volume-high icon, depending on the volume
function get_volume_icon {
    volume=$(get_volume)
    mute=$(get_mute)
    if [ "$volume" -eq 0 ] || [ "$mute" == "yes" ] ; then
        volume_icon="🔇"
    elif [ "$volume" -lt 50 ]; then
        volume_icon=" "
    else
        volume_icon=" "
    fi 
}

# Displays a volume notification
function show_volume_notif {
    volume=$(get_mute)
    get_volume_icon

    if [[ $show_music_in_volume_indicator == "true" ]]; then
        current_song=$(playerctl -f "{{title}} - {{artist}}" metadata)
        notify-send -t $notification_timeout -h string:x-dunst-stack-tag:volume_notif -h int:value:$volume "$volume_icon $volume%" "$current_song"
    else
        notify-send -t $notification_timeout -h string:x-dunst-stack-tag:volume_notif -h int:value:$volume "$volume_icon $volume%"
    fi
}

# Main function - Takes user input, "volume_up", "volume_down", "brightness_up", or "brightness_down"
case $1 in
    # Volume =============================================================
    volume_up)
    # Unmutes and increases volume, then displays the notification
    pactl set-sink-mute @DEFAULT_SINK@ 0
    volume=$(get_volume)
    if [ $(( "$volume" + "$volume_step" )) -gt $max_volume ]; then
        pactl set-sink-volume @DEFAULT_SINK@ $max_volume%
    else
        pactl set-sink-volume @DEFAULT_SINK@ +$volume_step%
    fi
    show_volume_notif
    ;;

    volume_down)
    # Lowers volume and displays the notification
    pactl set-sink-volume @DEFAULT_SINK@ -$volume_step%
    show_volume_notif
    ;;

    volume_mute)
    # Toggles mute and displays the notification
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    show_volume_notif
    ;;

    # Media keys =========================================================
    next)
    # Skips to the next song
    playerctl next
    ;;

    prev)
    # Skips to the previous song
    playerctl previous
    ;;

    play_pause)
    # Pauses/resumes playback
    playerctl play-pause
    ;;
esac
