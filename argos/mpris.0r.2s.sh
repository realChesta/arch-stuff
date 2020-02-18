#!/bin/bash

playerFile="$HOME/.config/argos/.mpris-player"
players="$(playerctl -l)"

# the file with the selected player exists, so we try to read
# what player was selected to control, and if it still exists
if [ -f "$playerFile" ]; then
    fileSelectedPlayer="$(cat $playerFile)"
fi

while IFS= read -r item; do
    if [ -n "$fileSelectedPlayer" ] && [ "$fileSelectedPlayer" == "$item" ]; then
        selectedPlayer="$item"
        playerMenu="$playerMenu--$item | iconName=media-playback-start-symbolic bash='echo $item > $playerFile' terminal=false\n"
    else
        playerMenu="$playerMenu--$item | bash='echo $item > $playerFile' terminal=false\n"
    fi
done <<< "$players"

if [ -n "$selectedPlayer" ]; then
    selectedPlayer="-p $selectedPlayer"
else
    rm -f "$playerFile"
fi

status="$(playerctl status $selectedPlayer 2>&1)"
current="$(playerctl metadata $selectedPlayer --format '{{ title }} ~ {{ artist }}')"

if (echo "$status" | grep -q "No players"); then
    echo "---"
    exit
elif (echo "$status" | grep -q "Stopped"); then
    status_char="⏹"
    current=""
elif echo "$status" | grep -q "Paused"; then
    status_char="⏸"
    play_pause="Play | iconName=media-playback-start-symbolic bash='playerctl play $selectedPlayer' terminal=false"
elif echo "$status" | grep -q "Playing"; then
    status_char="⏵"
    play_pause="Pause | iconName=media-playback-pause-symbolic bash='playerctl pause $selectedPlayer' terminal=false"
fi

echo "$status_char $current"
echo "---"
echo "Previous | iconName=media-skip-backward-symbolic bash='playerctl previous $selectedPlayer' terminal=false"
echo "$play_pause"
echo "Next | iconName=media-skip-forward-symbolic bash='playerctl next $selectedPlayer' terminal=false"

echo "---"
echo "Active Player"
echo -e "$playerMenu"
