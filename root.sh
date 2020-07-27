#!/bin/sh

printf "Chose 1 of the supported distros:\n1) Fedora (rpm)\n2) Arch (pacman)\n"
read what_distro

if [ ${what_distro} -eq 1 ]; then
	instal="dnf install"
	jetbrains="jetbrains-mono-fonts"
	fontawesome="fontawesome-fonts"
	firacode="fira-code-fonts"
	noto_fonts="google-noto-fonts-common"
	xorg="xorg-x11-xinit xorg-x11-server-common xorg-x11-server-devel xorg-x11-server-Xorg xorg-x11-server-utils"
	xorg_devel="libXinerama-devel libXft-devel libX11-devel libXext-devel xorg-x11-server-devel"
	sudo dnf copr enable opuk/pamixer
	dnf copr enable skidnik/clipmenu
elif [ ${what_distro} -eq 2 ]; then
	instal="pacman -S"
	jetbrains="ttf-jetbrains-mono"
	fontawesome="otf-font-awesome"
	firacode="ttf-fira-code"
	noto_fonts="noto-fonts"
	xorg="xorg-xinit xorg-server xorg-xsetroot"
	xorg_devel=""
fi

# utils
${install} openssh dash xdg-user-dirs pulseaudio pamixer zsh playerctl flameshot

# GNU/Stow is the util used for the dotfiles repo
${install} stow

# fonts
${install} ${jetbrains} ${fontawesome} ${firacode} ${noto_fonts}

# Xorg
${install} ${xorg} ${xorg_devel}

# Xorg utils
${install} feh imagemagick i3lock picom xsel xclip sxhkd

# Apps
${install} zathura zathura-pdf-poppler mpv firefox nnn cmus rofi neovim sxiv
ln -s /usr/bin/rofi /usr/bin/dmenu

## directory setup
if [ ${what_distro} -eq 2 ]; then
	/usr/bin/ln -sfT dash /usr/bin/sh
	mv dash.hook /usr/share/libalpm/hooks/bash-update.hook
fi
mkdir -p /etc/X11/xorg.conf.d
mv mouse_accel.conf /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
