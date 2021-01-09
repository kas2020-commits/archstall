#!/bin/sh

install_cmd="pacman -S --noconfirm"
${install_cmd} openssh dash xdg-user-dirs pulseaudio zsh playerctl

${install_cmd} xorg-xinit xorg-server xorg-xsetroot xsel xclip light pamixer
${install_cmd} i3lock picom sxhkd nitrogen imagemagick

## Changing default shell (/bin/sh) to dash
[ -f /usr/bin/dash ] && /usr/bin/ln -sfT dash /usr/bin/sh
cp resources/dash.hook /usr/share/libalpm/hooks/bash-update.hook

# fix the mouse acceleration on Xorg
[ -d /etc/X11/xorg.conf.d ] && cp resources/mouse_accel.conf /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
