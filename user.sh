#!/bin/sh

printf "Chose 1 of the supported distros:\n1) Fedora (rpm)\n2) Arch (pacman)\n"
read what_distro

if [ ${what_distro} -eq 1 ]; then
	instal="dnf install"
	jetbrains="jetbrains-mono-fonts"
	fontawesome="fontawesome-fonts"
	firacode="fira-code-fonts"
	noto_fonts="google-noto-fonts-common"
	sudo dnf copr enable opuk/pamixer
	xorg="xorg-x11-xinit xorg-x11-server-common xorg-x11-server-devel xorg-x11-server-Xorg xorg-x11-server-utils"
	xorg_devel="libXinerama-devel libXft-devel libX11-devel libXext-devel xorg-x11-server-devel"
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
sudo ${install} openssh dash xdg-user-dirs pulseaudio pamixer zsh playerctl flameshot

# fonts
sudo ${install} ${jetbrains} ${fontawesome} ${firacode} ${noto_fonts}

# Xorg
sudo ${install} ${xorg} ${xorg_devel}

# Xorg utils
sudo ${install} feh imagemagick i3lock picom xsel xclip sxhkd

# Neovim plugin manager
curl -fLo "$HOME"/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Apps
sudo ${install} zathura zathura-pdf-poppler mpv firefox nnn cmus rofi neovim sxiv
sudo ln -s /usr/bin/rofi /usr/bin/dmenu

# Default applications
xdg-mime default org.pwmt.zathura.desktop application/pdf

## directory setup
if [ ${what_distro} -eq 2 ]; then
	sudo /usr/bin/ln -sfT dash /usr/bin/sh
	sudo mv dash.hook /usr/share/libalpm/hooks/bash-update.hook
fi
sudo mkdir -p /etc/X11/xorg.conf.d
sudo mv mouse_accel.conf /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
mkdir -p "$HOME"/Pictures/Screenshots
mkdir -p "$HOME"/.local/github
mkdir -p "$HOME"/.cache/zsh

## refresh & configure utils
xdg-user-dirs-update
sudo usermod -s /bin/zsh "$USER"
