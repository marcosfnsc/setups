#!/bin/bash

# based on https://github.com/realgrm/general-scripts/blob/main/Fedora-Workstation-post-install.sh

# Add repositories rpmfusion free e non-free
sudo dnf install -y \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# -----------------------

# add repository vscode
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# add apps
APPS_ADD=(	
    audacity              # editor de audio
    #'atom', # editor de texto dedicado a programação
    code                  # editor de codigo - visual studio code
    cmake                 # utilitario de compilação de codigo c/c++
    ffmpeg                # conversor de arquivos de midia
    flatpak 
    gcc-g++               # compilador de c++
    git                   # ferramenta de versionamento de arquivos
    gimp                  # editor de imagem
    glogg                 # editor de texto focado em ler arquivos grandes
    gparted               # gerenciador grafico de partições do disco rigido
    htop                  # monitor de tarefas via terminal
    java-11-openjdk       # runtime do jdk 11
    java-11-openjdk-devel # ferramentas de compilação do jdk 11
    kate                  # editor de texto simples com alguns recursos avançados
    akmod-wl              # driver do wifi
    k3b                   # programa pra gravar, copiar e apagar CDs/DVDs
    libreoffice           # programas de escritorio
    #'kernel-devel', # é necessario pra instalar o modulo do virtualbox
    nano                  # editor de texto via terminal
    qbittorrent           # cliente de torrent
    #'openssh', # programa de ssh
    #'pavucontrol-qt', # ferramenta simples para editar opções de som
    screenfetch
    skanlite              # scanner de impressora
    VirtualBox
    vlc                   # reprodutor de audio e video
    zeal                  # ferramenta pra gerenciar documentação de softwares
    zsh
)

dnf install -y ${APPS_ADD[@]}

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
)	

dnf remove -y ${APPS_REMOVE[@]}

# -----------------------

# install flatpak apps
FLATPAK_FLATHUB=(
    com.discordapp.Discord  # Discord
    com.spotify.Client      # Spotify
    com.valsesoftware.Steam # Steam
    org.telegram.desktop    # telegram
)

flatpak install -y flathub ${FLATPAK_FLATHUB[@]}

# -----------------------

# install vscode extensions
VSCODE_EXTENSION=(
    alexcvzz.vscode.sqlite      # sqlite
    ms-python.python            # suporte a python
    ms-vscode.cpptools          # suporte a c++
    redhat.java                 # suporte a java
    redhat.vscode-xml           # suporte a xml
    ritwickdey.LiveServer       # ferramenta web
    zhuangtongfa.material-theme # One Dark Pro - tema
    matklad.rust-analyzer       # suporte a rust
)

for app in ${VSCODE_EXTENSION[@]}; do
    code --install-extension "$app"
done

# -----------------------

# config version java
alternatives --config java
alternatives --config javac

# -----------------------
