#!/usr/bin/env bash

APPS_INSTALL=(
  #clang
  #gimp
  #glow
  #kate
  #pipewire-pulse
  base-devel
  broadcom-wl # drivers wifi
  curl
  earlyoom
  ffmpeg
  firewalld
  flatpak
  gcc
  git
  htop
  k3b
  kde-applications
  kitty
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


## install yay
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si


#systemctl enable fstrim.timer # for sdd with TRIM support
systemctl enable earlyoom
systemctl enable firewalld
systemctl enable paccache.timer
systemctl enable sddm

#other scripts
./anylinux.sh
