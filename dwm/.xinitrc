xrdb -merge $HOME/.Xresources
# fix monitor order
xrandr --auto --output HDMI-0 --primary --right-of DVI-D-0 --output DVI-D-0 --rotate right

xset fp+ /usr/share/fonts/misc
fc-cache -fv

sxhkd -c ~/.sxhkdrc &

# ermm.... figure out how do not use this hack sometime?
sudo setfacl -m u:nc:rw /dev/snd/*

compton --config $HOME/.compton.conf &
mkbg ~/img/bkg/tile/escheresque_ste.png &

while xsetroot -name "`mpc 1>/dev/null 2>/dev/null && mpc cur_playing | head -n1`| `date '+%m/%d %H:%M'`"
do
    sleep 1
done &

while true
do
    dwm
done
