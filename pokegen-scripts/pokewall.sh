#!/bin/bash

# this uses https://github.com/realChesta/Pokemon-Terminal/tree/print-path

WALLPATH=$(pokemon -p $(cat "/usr/share/plymouth/themes/pokemon/pokenum.txt") | sed -n '2p')

cp "$WALLPATH" "/usr/share/backgrounds/current-pokemon.jpg"