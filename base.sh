#!/bin/bash

# wiki
## https://wiki.archlinux.org/title/Installation_guide
## https://wiki.archlinux.org/title/Install_Arch_Linux_from_existing_Linux
## https://wiki.archlinux.org/title/Arch_boot_process
## https://wiki.archlinux.org/title/General_recommendations
## https://wiki.archlinux.org/title/General_troubleshooting
## https://wiki.archlinux.org/title/Kernel
## https://wiki.archlinux.org/title/Kernel/Arch_Build_System
## https://wiki.archlinux.org/title/Kernel/Traditional_compilation

# Base settings
## Base packages
pacman -K /mnt base base-devel devtools

# Kernel settings
## CPU
### Intel
pacstrap -K /mnt intel-ucode
## Kernel
### linux-zen-kernel
#pacstrap -S --noconfirm linux-zen linux-zen-headers
### linux-kernel
pacstrap -K /mnt linux linux-headers linux-firmware

# Bootloader
## UEFI
pacstrap -K /mnt efibootmgr
## systemd-boot
pacstrap -K /mnt systemd-boot

# XDG Base Directory settings
pacstrap -K /mnt xdg-user-dirs xdg-utils

# git
pacstrap -K /mnt git

# text editor
## vim
pacstrap -K /mnt vim

# fstab
genfstab -U /mnt >> /mnt/etc/fstab

# file copy
## General.sh
cp General.sh /mnt/General.sh
## 99-kmscon.conf
cp 99-kmscon.conf /mnt/99-kmscon.conf
## reflector.conf
cp reflector.conf /mnt/reflector.conf

# chroot
arch-chroot /mnt