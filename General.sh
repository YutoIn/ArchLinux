#!/bin/bash

# wiki
## https://wiki.archlinux.org/title/Table_of_contents
## https://wiki.archlinux.org/title/General_recommendations

# ----General settings----
# System administration
## Time settings
ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
hwclock --systohc
## Locale settings
sed -i 's/#en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen
sed -i 's/#ja_JP.UTF-8/ja_JP.UTF-8/' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
## Keyboard settings
echo "KEYMAP=jp106" >> /etc/vconsole.conf
## Network settings
echo "ArchLinux" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
## user settings(root)
echo root:password | chpasswd
## user settings(yuto)
useradd -m yuto
echo yuto:password | chpasswd
usermod -aG libvirt yuto
echo "yuto ALL=(ALL) ALL" >> /etc/sudoers.d/yuto

# Package management
## AUR Package Manager(yay)
pacman -S --noconfirm yay
## Mirrorlist update(Reflector)
pacman -S --noconfirm reflector
reflector -c Japan -a 5 --sort rate --save /etc/pacman.d/mirrorlist
cp ./reflector.conf /etc/xdg/reflector/reflector.conf
systemctl enable reflector.timer
Pacman -Syy

# Graphical User Interface
## wiki
### https://wiki.archlinux.org/title/Xorg
### https://wiki.archlinux.org/title/Wayland
## Driver
### intel
pacman -S --noconfirm xf86-video-intel
### nvidia
pacman -S --noconfirm nvidia nvidia-utils nvidia-settings
echo options nvidia_drm modeset=1 | sudo tee /etc/modprobe.d/nvidia_drm.conf
## Display Server
### Wayland
pacman -S --noconfirm wayland xorg-xwayland
## Display Environment(Wayland)
### KDE(Plasma-Wayland-Session)
pacman -S --noconfirm plasma-wayland-session kde-applications
## Window Manager(Wayland)
### kwin
pacman -S --noconfirm kwin
## Display Manager(Wayland)
### sddm
pacman -S --noconfirm sddm
systemctl enable sddm
## Fonts
### wiki
#### https://wiki.archlinux.org/title/Fonts
#### https://wiki.archlinux.org/title/Font_configuration
#### https://wiki.archlinux.jp/index.php/%E3%83%95%E3%82%A9%E3%83%B3%E3%83%88
#### https://wiki.archlinux.jp/index.php/%E3%83%95%E3%82%A9%E3%83%B3%E3%83%88%E8%A8%AD%E5%AE%9A
# Find out about pango later
### Fonts(base)
pacman -S --noconfirm noto-fonts ttf-liberation ttf-roboto ttf-roboto-mono ttf-ubuntu-font-family
### Fonts(japanese)
pacman -S --noconfirm adobe-source-han-sans-jp-fonts adobe-source-han-serif-jp-fonts ttf-dejavu otf-ipafont noto-fonts-cjk
### Fonts(emoji)
pacman -S --noconfirm noto-fonts-emoji ttf-joypixels
### Fonts(windows10/11)
# https://aur.archlinux.org/packages/ttf-ms-win10-auto/
# https://aur.archlinux.org/packages/ttf-ms-win11-auto/
yay -S --noconfirm ttf-ms-win10-japanese
yay -S --noconfirm ttf-ms-win11-japanese

# Command Line Interface
## kmscon
yay -S --noconfirm kmscon
mkdir /etc/kmscon
echo "xkb-layout=jp" >> /etc/kmscon/kmscon.conf
echo "# export jp locale when COLORTERM is set" >> /etc/profile.d/locale.sh
echo "[[ -n "$COLORTERM" ]] && export LANG=ja_JP.UTF-8" >> /etc/profile.d/locale.sh
ln -s /usr/lib/systemd/system/kmsconvt\@.service /etc/systemd/system/autovt\@.service
cp ./99-kmscon.conf /etc/fonts/conf.d/99-kmscon.conf
## dialog
pacman -S --noconfirm dialog
## w3m
pacman -S --noconfirm w3m
## ranger
pacman -S --noconfirm ranger
## neofetch
pacman -S --noconfirm neofetch
## htop
pacman -S --noconfirm htop
## tmux
pacman -S --noconfirm tmux
## eza
pacman -S --noconfirm eza
## dust
pacman -S --noconfirm dust
## bat
pacman -S --noconfirm bat
## fd
pacman -S --noconfirm fd
## ripgrep-all
pacman -S --noconfirm ripgrep-all
## duf
pacman -S --noconfirm duf

# Shell
## bash
pacman -S --noconfirm bash-completion
## zsh
#pacman -S --noconfirm zsh zsh-completions
#echo "autoload -Uz compinit" >> /etc/zsh/zshrc
#echo "compinit" >> /etc/zsh/zshrc
#echo "promptinit" >> /etc/zsh/zshrc
#echo "zstyle ':completion:*' menu select" >> /etc/zsh/zshrc
#echo "zstyle ':completion::complete:*' gain-privileges 1" >> /etc/zsh/zshrc
## fish
#pacman -S --noconfirm fish
# check it out later

# Power Management
## acpi
pacman -S --noconfirm acpi acpi_call acpid
systemctl enable acpid
## TLP
pacman -S --noconfirm tlp
systemctl enable tlp

# Networking
## NetworkManager
pacman -S --noconfirm networkmanager network-manager-applet
systemctl enable NetworkManager
## inetutils (various networking utilities, including ping and telnet)
pacman -S --noconfirm inetutils
## iptables-nft
pacman -S --noconfirm iptables-nft
## ipset
pacman -S --noconfirm ipset
## Supplicant(Wi-Fi support)
pacman -S --noconfirm wpa_supplicant
## DNS
pacman -S --noconfirm bind
## NTP
pacman -S --noconfirm chrony
systemctl enable chronyd
## Firewall
pacman -S --noconfirm firewalld
systemctl enable firewalld
## SSH
pacman -S --noconfirm openssh
systemctl enable sshd
## VPN
pacman -S --noconfirm openvpn
## rsync
pacman -S --noconfirm rsync
## Bluetooth
pacman -S --noconfirm bluez bluez-utils
systemctl enable bluetooth
## Avahi
pacman -S --noconfirm avahi
systemctl enable avahi-daemon
## cups(printer support)
pacman -S --noconfirm cups
systemctl enable cups.service
### HP
#pacman -S --noconfirm hplip
### Epson
#pacman -S --noconfirm epson-inkjet-printer-escpr
### Canon
#pacman -S --noconfirm cnijfilter2

# Audio Settings
## ALSA
pacman -S --noconfirm alsa-utils
## PulseAudio
pacman -S --noconfirm pipewire pipewire-alsa pipewire-pulse pipewire-jack

# File System
## fstrim(btrfs trim timer)
#systemctl enable fstrim.timer
## ntfs-3g(ntfs support)
pacman -S --noconfirm ntfs-3g
## exfat(exfat support)
pacman -S --noconfirm exfat-utils
## dosfstools(make fat32 filesystems)
pacman -S --noconfirm dosfstools
## mtools(MS-DOS file system tools)
pacman -S --noconfirm mtools
## nfs-utils(NFS support)
pacman -S --noconfirm nfs-utils
## gvfs(gvfs support)
pacman -S --noconfirm gvfs
## gvfs-smb(gvfs support)
pacman -S --noconfirm gvfs-smb

# virtualization
## wiki
### https://wiki.archlinux.org/title/Libvirt
### https://wiki.archlinux.org/title/QEMU
### https://wiki.archlinux.org/title/Virt-manager
## libvirt
pacman -S --noconfirm libvirt
## qemu
pacman -S --noconfirm qemu qemu-arch-extra
## virt-manager
pacman -S --noconfirm virt-manager
## bridge-utils
pacman -S --noconfirm bridge-utils
## dnsmasq
pacman -S --noconfirm dnsmasq
## vde2
pacman -S --noconfirm vde2
## openbsd-netcat
pacman -S --noconfirm openbsd-netcat
## edk2-ovmf
pacman -S --noconfirm edk2-ovmf
systemctl enable libvirtd

# Browser
## Google Chrome
yay -S --noconfirm google-chrome
## browsh
yay -S --noconfirm browsh

# text editor
## neovim
pacman -S --noconfirm neovim
## Visual Studio Code
yay -S --noconfirm visual-studio-code-bin

# Video Player
## vlc
pacman -S --noconfirm vlc

# Screen Recorder
## obs-studio
pacman -S --noconfirm obs-studio