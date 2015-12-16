# xrdb -merge $HOME/.Xresources
#
# for f in `ls /usr/share/fonts/bitmap`
# do
# 	xset fp+ /usr/share/fonts/bitmap/$f
# done
# fc-cache -fv
#
# mopidy &
# sxhkd -c ~/.sxhkdrc &
#
# # ermm.... figure out how do not use this hack sometime?
# sudo setfacl -m u:nc:rw /dev/snd/*
#
# charliebar &
# mkbg &
# exec cwm
exec xfce4-session
