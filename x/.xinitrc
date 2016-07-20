xrdb -merge $HOME/.Xresources

xset fp+ /usr/share/fonts/misc
xset fp+ /usr/share/fonts/tewi-font/out/
xset r rate 200 35
fc-cache -fv

sxhkd -c ~/.sxhkdrc &

sudo setfacl -m u:nc:rw /dev/snd/*
compton --config $HOME/.compton.conf &
hsetroot -full ~/img/bkg/e1.jpg
charliebar &
xbanish &
compton &


while true
do
    cwm
done
