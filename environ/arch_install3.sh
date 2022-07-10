#!/usr/bin/env bash

APPS_INSTALL=(
  android-tools # adb and fastboot
  base-devel # for yay
  broadcom-wl # drivers wifi
  calibre
  cdrdao # for k3b
  cdrtools # for k3b 
  curl
  dvd+rw-tools # for k3b
  earlyoom
  ffmpeg
  firefox
  firewalld
  flameshot
  flatpak
  gcc
  git
  glow
  htop
  k3b
  kde-applications
  keepassxc
  kitty
  man-pages
  neofetch
  neomutt
  neovim
  networkmanager
  nmap
  nodejs
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  noto-fonts-extra
  okular
  openssh
  pacman-contrib
  pipewire-pulse
  plasma
  plasma-wayland-session # for wayland session
  qbittorrent
  rclone
  ripgrep
  sddm
  sshfs
  sudo
  tmux
  tree
  unzip
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
