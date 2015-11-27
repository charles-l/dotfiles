xrdb -merge $HOME/.Xresources

for f in `ls /usr/share/fonts/bitmap`
do
	echo /usr/share/fonts/bitmap/$f
done
fc-cache -fv

mopidy &
sxhkd -c ~/.sxhkdrc &

# ermm.... figure out how do not use this hack sometime?
sudo setfacl -m u:ninjacharlie:rw /dev/snd/*

exec cwm
