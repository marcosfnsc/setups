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

systemctl enable sddm

#other scripts
./anylinux.sh
