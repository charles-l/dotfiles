#!/bin/sh
xrdb -merge $HOME/.Xresources
xset r rate 200 35

#sxhkd -c ~/.sxhkdrc &
#compton --config $HOME/.compton.conf &
feh --bg-fill --no-xinerama /home/nc/img/bkg/wallhaven-314278.jpg
xbanish &
compton &

while true; do
    mcwm
done
