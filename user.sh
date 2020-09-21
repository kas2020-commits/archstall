#!/bin/sh

# Neovim plugin manager
curl -fLo "$HOME"/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Default applications
xdg-mime default org.pwmt.zathura.desktop application/pdf

mkdir -p "$HOME"/Pictures/Screenshots
mkdir -p "$HOME"/.local/github
mkdir -p "$HOME"/.cache/zsh

## refresh & configure utils
xdg-user-dirs-update
sudo usermod -s /bin/zsh "$USER"

# Install the rust toolchain for macOS/Linux
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
