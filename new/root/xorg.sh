#!/bin/sh

if [ $# -ne 1 ]; then
	echo "Bad input. Exiting..." && exit 1
fi

$1 xorg-xinit xorg-server xorg-xsetroot xsel xclip i3lock picom sxhkd nitrogen \
	imagemagick rofi albert

## Changing default shell (/bin/sh) to dash
[ -f /usr/bin/dash ] && /usr/bin/ln -sfT dash /usr/bin/sh
cp resources/dash.hook /usr/share/libalpm/hooks/bash-update.hook

# fix the mouse acceleration on Xorg
[ -d /etc/X11/xorg.conf.d ] && cp resources/mouse_accel.conf /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
