#!/bin/sh

if [ $# -ne 1 ]; then
	echo "Bad input. Exiting..." && exit 1
fi

$1 ttf-jetbrains-mono otf-font-awesome ttf-fira-code noto-fonts \
	ttf-inconsolata ttf-roboto ttf-roboto-mono noto-fonts noto-fonts-emoji \
	ttf-hack adobe-source-code-pro-fonts

