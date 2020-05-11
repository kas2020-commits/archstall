#!/bin/sh

gitpd=$(pwd)

# Important Utilities
sudo pacman -S openssh dash xdg-user-dirs pulseaudio pamixer

# fonts
sudo pacman -S otf-fira-code otf-font-awesome noto-fonts

# zsh
sudo pacman -S zsh zsh-autosuggestions zsh-syntax-highlighting

# Desktop
sudo pacman -S xorg-server xorg-xinit xorg-xsetroot xwallpaper xlcip xsel \
	pamixer imagemagick picom lxappearance-gtk3 scrot sxhkd i3lock

# Neovim/vim-plug
curl -fLo "$HOME"/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Apps
sudo pacman -S zathura zathura-pdf-poppler mpv firefox vifm cmus rofi neovim
sudo ln -s /usr/bin/rofi /usr/bin/dmenu

## moving files to the right spots
sudo /usr/bin/ln -sfT dash /usr/bin/sh
sudo mkdir -p /etc/X11/xorg.conf.d
sudo mv "$gitpd"dash.hook /usr/share/libalpm/hooks/bash-update.hook
sudo mv "$gitpd"/mouse_accel.conf /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
xdg-user-dirs-update
sudo usermod -s /bin/zsh "$USER"

## Create important dirs
mkdir -p "$HOME"/Pictures/Screenshots
mkdir -p "$HOME"/.local/github
mkdir -p "$HOME"/.cache/zsh

## Install dwm and st in tmp files so you can login and link it through ssh
git_dir=/tmp/setup
mkdir -p "$git_dir"
git clone https://github.com/kas2020-commits/dwm.git "$git_dir"/dwm
git clone https://github.com/kas2020-commits/st.git "$git_dir"/st
cd "$git_dir"/dwm
sudo make clean install
cd "$git_dir"/st
sudo make clean install
cd "$gitpd"
