#!/usr/bin/bash

## Variables ##
source="./telegram-panel.svg" # iconn source
font=Roboto-Bold # see 'identify -list font' for obtain the name of the font
messages=9999 # number of the messages printed in the dot 
size=64 # size of the final image
dot_size=30 # meassure in % (smallest than the size)
font_size=100 # meassure in % (smallest than the dot size)
dot_color=#5294e2
dot_muted_color=#555555
###############

# Some Math
max="$(echo "scale=1; $size*($dot_size/100)" | bc)"
mid="$(echo "scale=1; $max/2" | bc)"
psize="$(echo "scale=1; $mid*($font_size/100)" | bc)"

# dot image in SVG format
dot="<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"${max}\" height=\"${max}\"><path d=\"M${max} ${mid}a${mid} ${mid} 0 1 1-${max} 0 ${mid} ${mid} 0 1 1 ${max} 0z\" style=\"fill:##\"/></svg>"

# Detect the display density
dpi="$(xrdb -q | awk 'match($0, /Xft.dpi:\t([^ ]*)/, a) {print a[1];}')"

# create output folder
mkdir -p 'out'

# Create the base image icon_22_0.png and iconmute_22_0.png
convert -density $((dpi*2)) -background transparent -resize ${size} -trim "${source}" out/icon_22_0.png
cp out/icon_22_0.png out/iconmute_22_0.png

# Draw red and gray starting points
counter="\"##\""
echo "${dot//##/$dot_color}" | convert -background transparent -gravity Center svg:- png:- | composite -density ${dpi} -gravity SouthEast png:- out/icon_22_0.png out/icon_22_1.png
echo "${dot//##/$dot_muted_color}" | convert -background transparent -gravity Center svg:- png:- | composite -density ${dpi} -gravity SouthEast png:- out/icon_22_0.png out/iconmute_22_1.png

progr=0
# Create the message counter images
for i in $(seq 2 $messages); do
  np=$((100 * $i / $messages))
  if ((np - progr >= 5)); then
     echo $np%
     progr=$np
  fi
  cp out/icon_22_1.png out/icon_22_$i.png
  cp out/iconmute_22_1.png out/iconmute_22_$i.png
done

# Done
