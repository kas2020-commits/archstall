#!/bin/sh

[ $# -ne 2 ] && echo \
	"You must supply your git username and email (space separated in that order)" \
	&& exit 1

## Git
git config --global user.name $1
git config --global user.email $2

ssh-keygen -t rsa -b 4096 -C $2
ssh-add "$HOME"/.ssh/id_rsa

echo "add the following public key to your github then press enter:"
cat ~/.ssh/id_rsa.pub
# A stopper to allow for the user to do stuff
read bull

git_projects="$HOME"/.local/github
mkdir -p ${git_projects}
