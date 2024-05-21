#!/usr/bin/env bash

set -o errexit

APPS_INSTALL=(
  android-tools # adb and fastboot
  ark
  base-devel # for yay
  calibre # manage ebooks
  clamav
  curl
  docker-buildx
  dolphin
  earlyoom
  eza
  ffmpeg
  firefox
  firefox-developer-edition
  firewalld
  flameshot
  flatpak
  gcc
  git
  gwenview
  kamoso
  kate
  kcolorchooser # color selector
  kdeconnect
  keepassxc
  kid3-qt
  kitty
  konsole
  krunner5
  libreoffice-fresh # suite office
  libreoffice-fresh-pt-br # pacote de idioma pt-br para o libreoffice
  lsof
  man-db
  man-pages
  neofetch
  neomutt # email client in terminal
  neovim
  networkmanager
  nmap
  nodejs
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  noto-fonts-extra
  npm
  ntfs-3g # suporte ao sistema de qruivos ntfs
  okular
  openbsd-netcat
  openssh
  pacman-contrib
  partitionmanager
  pbzip2 # parallel implementation of the bzip2
  pipewire
  pipewire-pulse
  plasma
  plasma-wayland-session # for wayland session
  power-profiles-daemon
  qbittorrent
  qrencode
  rclone
  reflector
  ripgrep
  rsync
  sddm # lock screen
  spectacle
  sshfs # for the kdeconnect
  sudo
  thermald # for CPUs intel
  time
  tmux
  traceroute
  tree
  unzip
  usbutils # for get the lsusb command
  vlc
  yt-dlp
  zathura
  zathura-pdf-mupdf
  zsh
)

pacman -S --needed ${APPS_INSTALL[@]}

systemctl enable earlyoom
systemctl enable firewalld
systemctl enable paccache.timer
systemctl enable sddm
systemctl enable thermald # for CPUs intel

systemctl mask lvm2-monitor.service   # I will not use lvm2

#other scripts
../any_linux/anylinux.sh
