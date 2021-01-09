#!/bin/sh

if [ $# -ne 1 ]; then
	echo "Bad input. Exiting..." && exit 1
fi

printf "Give a username: " && read nameinput
while [ -z $nameinput ]; do
	printf "Bad name. Try again. Give a username: " && read nameinput
done

printf "Choose a shell from the supported list (Defaults to zsh):\n"
printf "1: zsh, 2: bash, 3: fish: " && read shellinput

if [ $shellinput -eq 1 ]; then
	usrsh="zsh"
elif [ $shellinput -eq 2 ]; then
	usrsh="bash"
elif [ $shellinput -eq 3 ]; then
	usrsh="fish"
else
	echo "Bad input. Defaulting to zsh" && myshell="zsh"
fi

if [ ! -x "/bin/$usrsh" ]; then
	echo "Oh no, you don't have that shell installed! Installing now..."
	$1 $usrsh
fi

echo "/bin/$usrsh"

useradd_toggles=""

printf "Create home directory? [Y/n]: " && read chome_
if [ -z $chome_ ] || ([ ! $chome_ = "n" ] && [ ! $chome_ = "N" ]); then
	$useradd_toggles += " -m "
fi

printf "Add to wheel group? [Y/n]: " && read wadd_
if [ -z $wadd_ ] || ([ ! $wadd_ = "n" ] && [ ! $wadd_ = "N" ]); then
	$useradd_toggles += " -G wheel "
fi

printf "Add to video group? [Y/n]: " && read vadd_
if [ -z $vadd_ ] || ([ ! $vadd_ = "n" ] && [ ! $vadd_ = "N" ]); then
	$useradd_toggles += " video "
fi

useradd $useradd_toggles -s $myshell $username
