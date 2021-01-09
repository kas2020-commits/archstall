#!/bin/sh

if [ $# -ne 1 ]; then
	echo "Bad input. Exiting..." && exit 1
fi

echo "Reinstalling required packages to ensure they are on the system..."

$1 base base-devel linux-firmware man-db man-pages vim networkmanager \
	linux linux-headers linux-lts linux-lts-headers

printf "Would you like to install the hardened kernel? [y/N]: " &&
	read hard_
if [ ! -z $hard_ ] && ([ $hard_ = "n" ] || [ $hard_ = "N" ]); then
	$1 linux-hardened linux-hardened-headers
fi

printf "Would you like to install the zen kernel? [y/N]: " &&
	read zen_
if [ ! -z $zen_ ] && ([ $zen_ = "n" ] || [ $zen_ = "N" ]); then
	$1 linux-zen linux-zen-headers
fi

