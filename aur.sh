
# Newest version of neovim
git clone https://aur.archlinux.org/neovim-nightly.git &&
	cd neovim-nightly &&
	makepkg -si &&
	cd .. &&
	rm -rf neovim-nightly

# brave browser
git clone https://aur.archlinux.org/brave-bin.git &&
	cd brave-bin &&
	makepkg -si &&
	cd .. &&
	rm -rf neovim-nightly
