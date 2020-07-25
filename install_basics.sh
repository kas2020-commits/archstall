#!/bin/sh

## Install dwm and st in tmp files so you can login and link it through ssh
git_dir=/tmp/setup
mkdir -p "$git_dir"
git clone https://github.com/kas2020-commits/dwm.git "$git_dir"/dwm
git clone https://github.com/kas2020-commits/st.git "$git_dir"/st
cd "$git_dir"/dwm
sudo make clean install
cd "$git_dir"/st
sudo make clean install
cd "$gitpd"
