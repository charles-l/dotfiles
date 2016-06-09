xrdb -merge $HOME/.Xresources
# fix monitor order
xrandr --auto --output HDMI-0 --primary --right-of DVI-D-0 --output DVI-D-0 --rotate right

xset fp+ /usr/share/fonts/misc
fc-cache -fv

sxhkd -c ~/.sxhkdrc &

# ermm.... figure out how do not use this hack sometime?
#sudo setfacl -m u:nc:rw /dev/snd/*

compton --config $HOME/.compton.conf &
feh --bg-fill ~/img/bkg/m1.jpg &

while true
do
    cwm
done
