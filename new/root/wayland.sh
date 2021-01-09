#!/bin/sh

if [ $# -ne 1 ]; then
	echo "Bad input. Exiting..." && exit 1
fi

$1 sway waybar wofi grim swaylock xorg-server-xwayland
