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
  com.discordapp.Discord    # Discord
  com.google.AndroidStudio  # Android Studio
  com.rtosta.zapzap         # cliente não oficial do whatssap
  com.spotify.Client        # Spotify
  com.valvesoftware.Steam   # Steam
  net.lutris.Lutris         # lutris
  org.audacityteam.Audacity # Audacity
  org.telegram.desktop      # telegram
)

flatpak install -y flathub ${FLATPAK_FLATHUB[@]} --user
