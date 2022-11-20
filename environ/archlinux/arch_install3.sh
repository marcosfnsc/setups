#!/usr/bin/env bash

APPS_INSTALL=(
  #kde-applications
  android-tools # adb and fastboot
  ark
  base-devel # for yay
  broadcom-wl-dkms # drivers wifi
  btop
  calibre # manage ebooks
  cdrdao # for k3b
  cdrtools # for k3b
  curl
  dolphin
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
  gwenview
  k3b
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
  linux-headers # Headers and scripts for building modules for the Linux kernel
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
  pipewire
  pipewire-pulse
  plasma
  plasma-wayland-session # for wayland session
  qbittorrent
  rclone
  ripgrep
  sddm # lock screen
  spectacle
  sshfs # for the kdeconnect
  sudo
  texlive-core # for get the latexmk command
  tlp
  tmux
  tree
  unzip
  usbutils # for get the lsusb command
  vlc
  xorg
  yt-dlp
  zathura
  zathura-pdf-mupdf
  zsh
)

pacman -S --needed ${APPS_INSTALL[@]}

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
