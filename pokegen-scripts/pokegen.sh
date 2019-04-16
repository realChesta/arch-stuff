#!/bin/bash

./pokemon-generator -k -p -u
./pokemover.sh
./pokewall.sh

function notify-send() {
    #Detect the name of the display in use
    local display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"

    #Detect the user using such display
    local user=$(who | grep '('$display')' | awk '{print $1}')

    #Detect the id of the user
    local uid=$(id -u $user)

    sudo -u $user DISPLAY=$display DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$uid/bus notify-send "$@"
}

function pokegen-notify() {
    if [ $1 == "-h" ]
    then
        notify-send "pokegen finished" "a new pokemon has been set." -i "/usr/share/pokegen/pokeball.png" -a "pokegen"
    else
        notify-send "pokegen finished" "the new pokemon is #$(cat /usr/share/plymouth/themes/pokemon/pokenum.txt)." -a "pokegen" -i "/usr/share/plymouth/themes/pokemon/bulb.png"
    fi
}


if [ $? -eq 0 ]; then
    pokegen-notify -h
else
    notify-send "pokegen failed" "something went wrong!" -a "pokegen"
fi


