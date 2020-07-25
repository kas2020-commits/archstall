#!/bin/sh

printf "Chose 1 of the supported distros:\n1) Fedora (rpm)\n2) Arch (pacman)\n"
read what_distro

if [ ${what_distro} -eq 1 ]; then
	instal="dnf install"
	jetbrains="jetbrains-mono-fonts"
	fontawesome="fontawesome-fonts"
	firacode="fira-code-fonts"
	noto_fonts="google-noto-fonts-common"
	xinit="xorg-x11-xinit"
	sudo dnf copr enable opuk/pamixer
elif [ ${what_distro} -eq 2 ]; then
	instal="pacman -S"
	jetbrains="ttf-jetbrains-mono"
	fontawesome="otf-font-awesome"
	firacode="ttf-fira-code"
	noto_fonts="noto-fonts"
	xinit="xorg-xinit"
fi

# Important Utilities
sudo ${install} openssh dash xdg-user-dirs pulseaudio pamixer zsh playerctl

# fonts
sudo ${install} ${jetbrains} ${fontawesome} ${firacode} ${noto_fonts}

# Desktop
sudo ${install} xorg-server ${xinit} xorg-xsetroot feh xlcip xsel \
	imagemagick picom lxappearance-gtk3 flameshot sxhkd i3lock

# Neovim/vim-plug
curl -fLo "$HOME"/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Apps
sudo ${install} zathura zathura-pdf-poppler mpv firefox nnn cmus rofi neovim sxiv
sudo ln -s /usr/bin/rofi /usr/bin/dmenu

# Defaults
xdg-mime default org.pwmt.zathura.desktop application/pdf

## moving files to the right spots
if [ ${what_distro} -eq 2 ]; then
	sudo /usr/bin/ln -sfT dash /usr/bin/sh
	sudo mv dash.hook /usr/share/libalpm/hooks/bash-update.hook
fi
sudo mkdir -p /etc/X11/xorg.conf.d
sudo mv mouse_accel.conf /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
xdg-user-dirs-update
sudo usermod -s /bin/zsh "$USER"

## Create important dirs
mkdir -p "$HOME"/Pictures/Screenshots
mkdir -p "$HOME"/.local/github
mkdir -p "$HOME"/.cache/zsh
