xrdb -merge $HOME/.Xresources
# fix monitor order
xrandr --auto --output HDMI-0 --primary --right-of DVI-D-0 --output DVI-D-0 --rotate right

xset fp+ /usr/share/fonts/misc
fc-cache -fv

sxhkd -c ~/.sxhkdrc &
sh ~/dev/ntfyd/ntfyd & # notification daemon
mopidy &

# ermm.... figure out how do not use this hack sometime?
sudo setfacl -m u:nc:rw /dev/snd/*

compton --config $HOME/.compton.conf &
feh --bg-fill ~/img/bkg/m1.jpg &

while xsetroot -name "`mpc 1>/dev/null 2>/dev/null && mpc cur | head -n1` | `date '+%m/%d %H:%M'`"
do
    sleep 1
done &

while true
do
    dwm
done
