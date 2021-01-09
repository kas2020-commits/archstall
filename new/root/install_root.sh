#!/bin/sh

printf "Before running this script, you must have completed everything in the
process up to but not including the boot loader (i.e. the base essentials have
been installed, and the script is being run by the root user under chroot). Have you done so [y/N]?" &&
	read init_
if [ ! -z $init_ ] && ([ $init_ = "n" ] || [ $init_ = "N" ]); then
	echo "Failed to satisfy prerequisits. Exiting..." && exit 1
else
	echo "Great! starting configuration now."
fi

checker=$(ls /sys/firmware/efi/efivars) 2> /dev/null
retval=$?
if [ $retval -ne 0 ]; then
	echo "It seems that you didn't boot using UEFI. This script does not support
	non-UEFI systems. Exiting..." && exit 1
fi

printf "Is windows installed somewhere else on this machine? [Y/n]: " &&
	read windows_
if [ -z $windows_ ] || ([ ! $windows_ = "n" ] && [ ! $windows_ = "N" ]); then
	./dualboot_config.sh
fi

install="pacman -S --noconfirm"

./base.sh ${install}

printf "Would you like to try using wayland instead of Xorg? [Y/n]: " &&
	read wayland_
if [ -z $wayland_ ] || ([ ! $wayland_ = "n" ] && [ ! $wayland_ = "N" ]); then
	./wayland.sh ${install}
fi

printf "Do you want to install basic development software? [Y/n]: " &&
	read chain_
if [ -z $chain_ ] || ([ ! $chain_ = "n" ] && [ ! $chain_ = "N" ]); then
	./development.sh ${install}
fi

printf "Do you want to install fonts? [Y/n]: " &&
	read fonts_
if [ -z $fonts_ ] || ([ ! $fonts_ = "n" ] && [ ! $fonts_ = "N" ]); then
	./fonts.sh ${install}
fi

printf "Do you want to install a basic set of utilities? [Y/n]: " &&
	read utils_
if [ -z $utils_ ] || ([ ! $utils_ = "n" ] && [ ! $utils_ = "N" ]); then
	./utils.sh ${install}
fi

printf "Would you like to install Xorg as a backup? [Y/n]: " &&
	read xorg_
if [ -z $xorg_ ] || ([ ! $xorg_ = "n" ] && [ ! $xorg_ = "N" ]); then
	./xorg.sh ${install}
fi

printf "Would you like to create a new user? [Y/n]: " &&
	read usr_
if [ -z $usr_ ] || ([ ! $usr_ = "n" ] && [ ! $usr_ = "N" ]); then
	./create_usr.sh ${install}
fi

