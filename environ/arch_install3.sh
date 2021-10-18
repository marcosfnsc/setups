#!/usr/bin/env bash

APPS_INSTALL=(
  #pipewire-pulse
  alacritty
  audacity
  base-devel
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
  noto-fonts
  noto-fonts-cjk
  noto-fonts-extra
  noto-fonts-emoji
)

pacman -S --needed ${APPS_INSTALL[@]}

hostnamectl set-hostname note

systemctl enable paccache.timer
systemctl enable sddm

#other scripts
./anylinux.sh
