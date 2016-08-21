#!/bin/sh
xrdb -merge $HOME/.Xresources
xset r rate 200 35

#sxhkd -c ~/.sxhkdrc &
feh --bg-fill --no-xinerama /home/nc/img/bkg/bio_gameboy_double.jpg
xbanish &

chrome &
#exec ~/dev/wwm/wwm
while true; do
   mcwm
done
