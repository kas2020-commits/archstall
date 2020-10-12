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
sudo usermod -aG sys network power video lp wheel "$USER"

# Install the rust toolchain for macOS/Linux
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# List of useful python packages for data science. Uncomment those you wish to
# install (Some of these are dependancies of others so some of these are
# reduntnat but it is useful to know what you're installing):
# pip install numpy
# pip install matplotlib
# pip install pandas
# pip install mpmath
# pip install sympy
