xrdb -merge $HOME/.Xresources

for f in `ls /usr/share/fonts/bitmap`
do
	xset fp+ /usr/share/fonts/bitmap/$f
done
fc-cache -fv

sxhkd -c ~/.sxhkdrc &

# ermm.... figure out how do not use this hack sometime?
sudo setfacl -m u:nc:rw /dev/snd/*

compton --config $HOME/.compton.conf &
mkbg &

while xsetroot -name "`date '+%m/%d %H:%M'`"
do
    sleep 1
done &

while true
do
    dwm
done
