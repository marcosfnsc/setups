#!/usr/bin/env bash

APPS_INSTALL=(
  android-tools # adb and fastboot
  base-devel # for yay
  broadcom-wl # drivers wifi
  btop
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
  k3b
  kde-applications
  keepassxc
  kitty
  libreoffice-fresh # suite office
  libreoffice-fresh-pt-br # pacote de idioma pt-br para o libreoffice
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
  tlp
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
systemctl enable tlp.service 

systemctl mask lvm2-monitor.service   # I will not use lvm2
systemctl mask systemd-rfkill.service # eliminate conflicts with tlp
systemctl mask systemd-rfkill.socket  # eliminate conflicts with tlp

#other scripts
../any_linux/anylinux.sh
