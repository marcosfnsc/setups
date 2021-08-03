#!/usr/bin/env bash

APPS_INSTALL=(
  alacritty
  audacity
  base-devel
  clang
  cmake
  curl
  ffmpeg
  flatpak
  gcc
  gimp
  git
  gparted
  htop
  k3b
  kate
  kde-applications
  neovim
  networkmanager
  nodejs
  okular
  openssh
  plasma
  qbittorrent
  screenfetch
  sddm
  sudo
  the_silver_searcher
  tmux
  tree
  xorg
  zsh
)

pacman -S --needed ${APPS_INSTALL[@]}

hostnamectl set-hostname note

## conf zram
echo 'zram' > /etc/modules-load.d/zram.conf
echo 'options zram num_devices=1' > /etc/modprobe.d/zram.conf

RAM_SIZE=$(free -h | sed -n '2 p' | awk '{print $2}')
echo "KERNEL==”zram0″, ATTR{disksize}=”$RAM_SIZE” RUN=”/usr/bin/mkswap /dev/zram0″, TAG+=”systemd”" > /etc/udev/rules.d/99-zram.rules
echo "/dev/zram0 none swap defaults 0 0" >> /etc/fstab

systemctl enable sddm
systemctl enable zram

#other scripts
cd setups/environ && ./anylinux.sh
