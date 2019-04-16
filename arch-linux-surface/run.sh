#!/bin/bash

# This script automatically downloads and installs
# the latest release of dmhacker/arch-linux-surface

echo Removing old files...
rm -f *.xz

echo Downloading newest release...

curl -s https://api.github.com/repos/dmhacker/arch-linux-surface/releases/latest | grep "browser_download_url.*xz" | cut -d : -f 2,3 | tr -d \" | wget -q --show-progress -i -

echo Starting pacman...
sudo pacman -U --needed *.xz
