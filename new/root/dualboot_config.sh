#!/bin/sh

# forces systemd/linux to use localtime.
timedatectl set-local-rtc 1 --adjust-system-clock
