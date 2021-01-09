#!/bin/sh

if [ $# -ne 1 ]; then
	echo "Bad input. Exiting..." && exit 1
fi

$1 fd fzf ripgrep nnn cmus transmission-gtk mpv imv firefox light alacritty \
	neovim
