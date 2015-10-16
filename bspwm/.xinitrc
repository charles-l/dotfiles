#!/bin/sh

xset +fp /usr/share/fonts/misc
for dir in /usr/share/fonts/bitmap/*
do
    if [ -d $dir ]
    then
        xset +fp $dir
    fi
done
xset fp rehash
sh ~/.config/colors/colors.sh > ~/.config/colors/dynamic

# no mouse acceleration
xset m 0
# ughgggg sound doesn't work otherwise
sudo setfacl -m u:ninjacharlie:rw /dev/snd/*

xrdb -merge $HOME/.Xresources
sxhkd -c $HOME/.sxhkdrc &

# Normal cursor
xsetroot -cursor_name left_ptr
unclutter &
mopidy &

charliebar & # start lemonbar with my configs

sudo wifi connect &
# Read libnotify garbage
statnot /home/ninjacharlie/.config/statnot/statnotrc &

compton &

exec bspwm
