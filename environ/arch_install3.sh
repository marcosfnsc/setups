#!/usr/bin/env bash

APPS_INSTALL=(
  #pipewire-pulse
  alacritty
  audacity
  base-devel
  broadcom-wl # drivers wifi
  clang
  curl
  ffmpeg
  flatpak
  gcc
  gimp
  git
  htop
  k3b
  kate
  kde-applications
  man-pages
  neovim
  networkmanager
  nodejs
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  noto-fonts-extra
  okular
  openssh
  pacman-contrib
  plasma
  qbittorrent
  ripgrep
  screenfetch
  sddm
  sudo
  tmux
  tree
  usbutils
  xorg
  zsh
)

pacman -S --needed ${APPS_INSTALL[@]}

hostnamectl set-hostname note

systemctl enable paccache.timer
systemctl enable sddm

#other scripts
./anylinux.sh
