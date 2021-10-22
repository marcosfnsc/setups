#!/usr/bin/env bash

APPS_INSTALL=(
  #clang
  #gimp
  #kate
  #pipewire-pulse
  alacritty
  audacity
  base-devel
  broadcom-wl # drivers wifi
  curl
  ffmpeg
  flatpak
  gcc
  git
  htop
  k3b
  kde-applications
  man-pages
  neofetch
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

#systemctl enable fstrim.timer for sdd with TRIM support
systemctl enable paccache.timer
systemctl enable sddm

#other scripts
./anylinux.sh
