#!/usr/bin/env bash

APPS_INSTALL=(
  #xorg 
  android-tools # adb and fastboot
  ark
  base-devel # for yay
  calibre # manage ebooks
  clamav
  curl
  dolphin
  earlyoom
  exa
  ffmpeg
  firefox
  firewalld
  flameshot
  flatpak
  gcc
  git
  glow
  gwenview
  kamoso
  kate
  kcolorchooser # color selector
  kdeconnect
  keepassxc
  kitty
  konsole
  krunner
  libreoffice-fresh # suite office
  libreoffice-fresh-pt-br # pacote de idioma pt-br para o libreoffice
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
  okular
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
  qemu-full # virtual machine manager
  rclone
  reflector
  ripgrep
  rsync
  sddm # lock screen
  spectacle
  sshfs # for the kdeconnect
  sudo
  texlive-core # for get the latexmk command
  tmux
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

systemctl mask lvm2-monitor.service   # I will not use lvm2

#other scripts
../any_linux/anylinux.sh
