from archlinux:latest

RUN pacman -Sy --noconfirm reflector
RUN reflector --latest 10 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist --verbose
RUN sed -E 's/^#ParallelDownloads.+$/ParallelDownloads = 10/' -i /etc/pacman.conf
RUN pacman -S --needed --noconfirm \
  base-devel \
  clang \
  curl \
  deno \
  docker-compose \
  eza \
  gcc \
  git \
  htop \
  jdk-openjdk \
  jq \
  less \
  neofetch \
  neovim \
  nodejs \
  npm \
  openssh \
  python \
  ripgrep \
  skim \
  sudo \
  tmux \
  tree \
  unzip \
  zsh

RUN useradd -m marcos \
  && chown -R marcos:marcos /home/marcos
WORKDIR /home/marcos

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
