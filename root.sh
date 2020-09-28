#!/bin/sh

install_cmd="pacman -S --noconfirm"

# utils
${install_cmd} openssh dash xdg-user-dirs pulseaudio pamixer zsh playerctl flameshot

# latex compiler and most extensions needed for most people.
${install_cmd} texlive-most

# C/C++ development
${install_cmd} clang gcc

# Computational development
${install_cmd} octave python-pip r

# GNU/Stow is the util used for the dotfiles repo
${install_cmd} stow

# fonts
${install_cmd} ttf-jetbrains-mono otf-font-awesome ttf-fira-code noto-fonts \
	ttf-inconsolata

# Xorg
${install_cmd} xorg-xinit xorg-server xorg-xsetroot xsel xclip

# Editor + Common Tools
${install_cmd} albert alacritty neovim zathura zathura-pdf-poppler \
	fd fzf ripgrep

# Window-Manager specific installs
${install_cmd} i3lock picom sxhkd nitrogen imagemagick

# Apps
${install_cmd} mpv firefox nnn cmus rofi sxiv
ln -s /usr/bin/rofi /usr/bin/dmenu

## Changing default shell to dash
[ -f /usr/bin/dash ] && /usr/bin/ln -sfT dash /usr/bin/sh
cp dash.hook /usr/share/libalpm/hooks/bash-update.hook

# fixing the mouse acceleration for WM's. If you use a DE, this is not
# recommended
[ -d /etc/X11/xorg.conf.d ] && cp mouse_accel.conf /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
