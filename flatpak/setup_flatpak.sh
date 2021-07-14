#!/usr/bin/env bash

# flathub remote
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo --user

# install flatpak apps
FLATPAK_FLATHUB=(
  com.discordapp.Discord  # Discord
  com.spotify.Client      # Spotify
  com.valsesoftware.Steam # Steam
  org.telegram.desktop    # telegram
)

flatpak install -y flathub ${FLATPAK_FLATHUB[@]}
