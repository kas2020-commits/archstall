#!/bin/sh

sudo ./root_install_packages.sh &&
	sudo ./root_make_user.sh &&
	sudo ./root_dualboot_config.sh &&
	sudo ./root_wm_config.sh &&
	./user_config.sh &&
	./git_setup.sh &&
	./aur.sh
