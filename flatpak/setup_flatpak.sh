#!/usr/bin/env bash

set -o errexit

if [ ! "$EUID" -ne 0 ];then
  echo "Please run this script as non root"
  exit 1
fi

# flathub remote
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo --user

# install flatpak apps
FLATPAK_FLATHUB=(
  com.discordapp.Discord     # Discord
  com.github.tchx84.Flatseal # flatseal
  com.protonvpn.www          # cliente não oficial do protonvpn
  com.rtosta.zapzap          # cliente não oficial do whatssap
  com.spotify.Client         # Spotify
  com.usebottles.bottles     # bottles
  com.valvesoftware.Steam    # Steam
  org.audacityteam.Audacity  # audacity
  org.telegram.desktop       # telegram
  org.zealdocs.Zeal          # zeal docs
)

flatpak install -y flathub ${FLATPAK_FLATHUB[@]} --user
