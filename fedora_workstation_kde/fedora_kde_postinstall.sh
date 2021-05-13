#!/bin/bash

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
    alacritty
    audacity              # editor de audio
    akmod-wl              # driver do wifi
    bzip2-devel
    clang
    cmake                 # utilitario de compilação de codigo c/c++
    curl
    ffmpeg                # conversor de arquivos de midia
    flatpak
    gcc-g++               # compilador de c++
    git                   # ferramenta de versionamento de arquivos
    gimp                  # editor de imagem
    glogg                 # editor de texto focado em ler arquivos grandes
    google-chrome-stable
    gparted               # gerenciador grafico de partições do disco rigido
    htop                  # monitor de tarefas via terminal
    java-11-openjdk       # runtime do jdk 11
    java-11-openjdk-devel # ferramentas de compilação do jdk 11
    kate                  # editor de texto simples com alguns recursos avançados
    k3b                   # programa pra gravar, copiar e apagar CDs/DVDs
    libreoffice           # programas de escritorio
    neovim
    nodejs
    openssh
    openssl-devel
    podman
    qbittorrent           # cliente de torrent
    #pavucontrol-qt # ferramenta simples para editar opções de som
    readline-devel
    screenfetch
    skanlite              # scanner de impressora
    sqlite-devel
    the_silver_searcher   # ag
    tmux
    tree
    VirtualBox
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

# flathub remote
sudo -u $username flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# install flatpak apps
FLATPAK_FLATHUB=(
    com.discordapp.Discord  # Discord
    com.spotify.Client      # Spotify
    com.valsesoftware.Steam # Steam
    org.telegram.desktop    # telegram
)

sudo -u $username flatpak install -y flathub ${FLATPAK_FLATHUB[@]}

# -----------------------

# config version java
alternatives --config java
alternatives --config javac

# -----------------------

# rust environpment
sudo -u $username curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# -----------------------

# config swap
echo "vm.swappiness=10" >> /etc/sysctl.conf

# -----------------------

# run other scripts
cd dotfiles   && sudo -u $username ./setup_dotfiles.sh && cd ../..
cd git_config && sudo -u $username ./setup_git.sh      && cd ..
cd nvim       && sudo -u $username ./setup_nvim.sh     && cd ..
cd tmux       && sudo -u $username ./setup_tmux.sh     && cd ..
cd zsh        && sudo -u $username ./setup_zsh.sh      && cd ..
cd fedora_workstation_kde

# -----------------------

# install pyenv
sudo -u $username curl https://pyenv.run | bash

# -----------------------

# install fzf
sudo -u $username git clone --depth 1 https://github.com/junegunn/fzf.git /home/$username/.fzf
sudo -u $username /home/$username/.fzf/install

# -----------------------
