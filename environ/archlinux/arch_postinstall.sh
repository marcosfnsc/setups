#!/usr/bin/env bash

set -o errexit

APPS_INSTALL=(
  ark
  bubblewrap
  calibre # manage ebooks
  clamav
  docker-buildx
  dolphin
  earlyoom
  ffmpeg
  firefox
  firefox-developer-edition
  firewalld
  flameshot
  flatpak
  gwenview
  kamoso
  kcolorchooser # color selector
  kdeconnect
  kid3-qt
  kitty
  konsole
  krunner
  libreoffice-fresh # suite office
  libreoffice-fresh-pt-br # pacote de idioma pt-br para o libreoffice
  man-db
  man-pages
  networkmanager
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  noto-fonts-extra
  openbsd-netcat
  openssh
  pacman-contrib
  partitionmanager
  pipewire
  pipewire-pulse
  plasma
  plasma-login-manager # lock screen
  plasma-wayland-session # for wayland session
  power-profiles-daemon
  python
  python-pip
  qrencode
  reflector
  spectacle
  sshfs # for the kdeconnect
  sudo
  thermald # for CPUs intel
  time
  traceroute
  unzip
  usbutils # for get the lsusb command
  zsh
)

pacman -S --needed ${APPS_INSTALL[@]}

systemctl enable earlyoom
systemctl enable firewalld
systemctl enable paccache.timer
systemctl enable plasmalogin
systemctl enable thermald # for CPUs intel

systemctl mask lvm2-monitor.service   # I will not use lvm2

#other scripts
../any_linux/anylinux.sh
