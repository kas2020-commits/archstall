# Archstall: quick scripts to install, configure and save an arch Linux setup.

## Full install

For a full install, you can just run the following, but **MAKE SURE YOU RUN THIS
AS THE USER AND NOT AS ROOT!!**

```
$ ./install
```

## Manual install

Run these scripts in the following order. Each script is independent, so skip
any script you don't require.
- `sudo ./root_install_packages.sh`
- `sudo ./root_make_user.sh`
- `sudo ./root_dualboot_config.sh`
- `sudo ./root_wm_config.sh`
- `./user_config.sh`
- `./git_setup.sh`
- `./aur.sh`
