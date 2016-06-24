xrdb -merge $HOME/.Xresources

xset fp+ /usr/share/fonts/misc
xset fp+ /usr/share/fonts/tewi-font/out/
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
