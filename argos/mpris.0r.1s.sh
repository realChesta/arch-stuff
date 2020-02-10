#!/bin/sh

status="$(playerctl status 2>&1)"
current=$(playerctl metadata --format "{{ title }} ~ {{ artist }}")

if (echo "$status" | grep -q "Stopped") || (echo "$status" | grep -q "No players"); then
    echo "---"
    exit
fi

if echo "$status" | grep -q "Paused"; then
    status_char="⏸"
    play_pause="Play | iconName=media-playback-start-symbolic bash='playerctl play' terminal=false"
elif echo "$status" | grep -q "Playing"; then
    status_char="⏵"
    play_pause="Pause | iconName=media-playback-pause-symbolic bash='playerctl pause' terminal=false"
fi

echo "$status_char $current\n---"
echo "Next | iconName=media-skip-forward-symbolic bash='playerctl next' terminal=false"
echo "$play_pause"
echo "Previous | iconName=media-skip-backward-symbolic bash='playerctl previous' terminal=false"
