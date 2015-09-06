#!/bin/sh

xset +fp /usr/share/fonts/misc
xset +fp $HOME/.fonts
xset fp rehash
sh ~/.config/colors/colors.sh > ~/.config/colors/dynamic

# no mouse acceleration
xset m 0
# ughgggg sound doesn't work otherwise
sudo setfacl -m u:ninjacharlie:rw /dev/snd/*

[ -f $HOME/.Xresources ] && xrdb -merge $HOME/.Xresources

sxhkd -c $HOME/.sxhkdrc &

# Normal cursor
xsetroot -cursor_name left_ptr

# Read libnotify garbage
statnot /home/ninjacharlie/.config/statnot/statnotrc &

compton &

exec i3
