#!/bin/sh

install_cmd="pacman -S --noconfirm"

# latex compiler and most extensions needed for most people.
${install_cmd} texlive-most

# C/C++ development
${install_cmd} clang gcc

# Computational development
${install_cmd} octave python-pip r

# GNU/Stow is the util used for the dotfiles repo
${install_cmd} stow

# fonts
${install_cmd} ttf-jetbrains-mono otf-font-awesome ttf-fira-code noto-fonts ttf-inconsolata

# Terminal
${install_cmd} alacritty vim zathura zathura-pdf-poppler flameshot

# cmd line tools
${install_cmd} fd fzf ripgrep

# Search tools
${install_cmd} rofi albert

# Apps
${install_cmd} mpv firefox nnn cmus sxiv transmission-gtk
