#!/bin/bash
# Input Method(Japanese)

# wiki
## fcitx5
### https://wiki.archlinux.jp/index.php/Fcitx5
## ibus
### https://wiki.archlinux.jp/index.php/IBus
## mozc
### https://wiki.archlinux.jp/index.php/Mozc
## uim
### https://wiki.archlinux.jp/index.php/UIM

# fcitx5
## On KDE, Fcitx5 is integrated with the System Settings so there is no need to run a separate app. (https://wiki.archlinux.org/title/Mozc#Fcitx5)
pacman -S --noconfirm fcitx5 fcitx5-mozc fcitx5-qt fcitx5-chewing fcitx5-configtool
# ibus
#pacman -S --noconfirm ibus ibus-mozc
# mozc
#pacman -S --noconfirm mozc
# uim
#pacman -S --noconfirm uim uim-mozc

# Set the environment variable
#echo "GTK_IM_MODULE=fcitx" >> ~/.bash_profile
#echo "QT_IM_MODULE=fcitx" >> ~/.bash_profile
## On KDE(Wayland), you need to set the environment variable like this.(https://wiki.archlinux.org/title/Fcitx5#KDE_Wayland)
echo "XMODIFIERS=@im=fcitx" >> ~/.bash_profile

# Enable the fcitx5 service
systemctl enable --user fcitx5