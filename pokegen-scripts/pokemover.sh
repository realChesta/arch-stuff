#!/bin/bash

# this script takes the current bulb.png and makes it the default avatar of the material2 theme.

if [ "$EUID" -ne 0 ]; then 
    echo "Please run as root."
    exit
fi

CANVAS_SIZE=128
BULB="/usr/share/plymouth/themes/pokemon/bulb.png"

WIDTH="$(magick identify -ping -format '%w' $BULB)"
HEIGHT="$(magick identify -ping -format '%h' $BULB)"

((OFFSET_W = $CANVAS_SIZE / 2 - $WIDTH / 2))
((OFFSET_H = $CANVAS_SIZE / 2 - $HEIGHT / 2))
OFFSET="+${OFFSET_W}+${OFFSET_H}"

magick convert -size "${CANVAS_SIZE}x${CANVAS_SIZE}" xc:none "canvas.png"
magick composite -geometry "$OFFSET" "$BULB" "canvas.png" "/usr/share/lightdm-webkit/themes/material2/static/avatar.png"

rm "canvas.png"