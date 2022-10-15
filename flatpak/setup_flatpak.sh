#!/usr/bin/env bash

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
  com.spotify.Client        # Spotify
  com.valsesoftware.Steam   # Steam
  org.audacityteam.Audacity # Audacity
  org.telegram.desktop      # telegram
)

flatpak install -y flathub ${FLATPAK_FLATHUB[@]}
