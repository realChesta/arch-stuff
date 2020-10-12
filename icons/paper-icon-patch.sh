#!/bin/bash

cd /usr/share/icons

# copy over the battery level icons
cp ./Papirus/symbolic/status/battery-level-* ./Paper/scalable/

# copy over telegram icons
cp ./Papirus/16x16/panel/telegram-* ./Paper/16x16/panel/
cp ./Papirus/22x22/panel/telegram-* ./Paper/22x22/panel/
cp ./Papirus/24x24/panel/telegram-* ./Paper/24x24/panel/

gtk-update-icon-cache  /usr/share/icons/Paper
