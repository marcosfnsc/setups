#!/usr/bin/env bash

# based on https://github.com/realgrm/general-scripts/blob/main/Fedora-Workstation-post-install.sh

username=marcos

# -----------------------

# enable deltarpm
dnf config-manager --setopt=deltarpm=True --save

# config dnf to find a fast mirror
dnf config-manager --setopt=fastestmirror=True --save
dnf makecache --refresh

# enable repositories
dnf install -y fedora-workstation-repositories
dnf config-manager --set-enabled google-chrome

# rpmfusion free and non-free
dnf install -y \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# add apps
APPS_ADD=(
  #pavucontrol-qt # ferramenta simples para editar opções de som
  VirtualBox
  akmod-wl              # driver do wifi
  alacritty
  audacity              # editor de audio
  bzip2-devel
  clang
  cmake                 # utilitario de compilação de codigo c/c++
  curl
  ffmpeg                # conversor de arquivos de midia
  flatpak
  gcc-g++               # compilador de c++
  gimp                  # editor de imagem
  git                   # ferramenta de versionamento de arquivos
  google-chrome-stable
  gparted               # gerenciador grafico de partições do disco rigido
  htop                  # monitor de tarefas via terminal
  java-11-openjdk       # runtime do jdk 11
  java-11-openjdk-devel # ferramentas de compilação do jdk 11
  k3b                   # programa pra gravar, copiar e apagar CDs/DVDs
  kate                  # editor de texto simples com alguns recursos avançados
  libreoffice           # programas de escritorio
  neovim
  nodejs
  okular                # leitor de pdf
  openssh
  openssl-devel
  qbittorrent           # cliente de torrent
  readline-devel
  ripgrep
  screenfetch
  skanlite              # scanner de impressora
  sqlite-devel
  tmux
  tree
  vlc                   # reprodutor de audio e video
  zeal                  # ferramenta pra gerenciar documentação de softwares
  zsh
)

dnf install -y --skip-broken ${APPS_ADD[@]}

# -----------------------

# remove apps
APPS_REMOVE=(
  akregator
  calligra-core
  dnfdragora
  dragon
  falkon
  juk
  #kde-partitionmanager
  kget
  kmahjongg
  kmail
  kmines
  konversation
  kpat
  kolourpaint
  konqueror
  korganizer
  krdc
  krfb
  kruter
  ktorrent
  kwrite
  plasma-discover
)

dnf remove -y ${APPS_REMOVE[@]}

# -----------------------

# run other scripts
# -----------------------
