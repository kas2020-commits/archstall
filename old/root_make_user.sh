#!/bin/sh

[ $# -ne 1 ] && echo \
	"call this script with a desired username" \
	&& exit 1

useradd -m -G wheel video -s /bin/zsh $1
