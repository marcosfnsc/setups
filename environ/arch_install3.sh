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
  pipewire-pulse
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
