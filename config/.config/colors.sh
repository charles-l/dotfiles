#!/bin/sh
IMG=`ls $HOME/img/*.png | shuffle | head -n 1`
COLORS=`colors -n 18 $IMG`
feh  --bg-fill "$IMG"
i=0
echo '*background: ' `printf "$COLORS" | head -n 1`
echo '*foreground: ' `printf "$COLORS" | tail -n 1`
for l in `printf "$COLORS" | head -n 17 | tail -n 16 | tac`; do
  echo '*color'$i':' $l
  i=`echo "$i + 1" | bc`
done

unset i
unset IMG
