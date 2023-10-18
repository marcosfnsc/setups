from archlinux:latest

RUN pacman -Sy --needed --noconfirm \
  curl \
  eza \
  gcc \
  git \
  htop \
  jdk-openjdk \
  neofetch \
  neovim \
  nodejs \
  npm \
  openssh \
  python \
  ripgrep \
  tmux \
  unzip \
  zsh

# create user non root
ARG UID=1000
ARG GID=1000

RUN groupadd -g "${GID}" marcos \
  && useradd --create-home --no-log-init -u "${UID}" -g "${GID}" marcos
USER marcos

ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]
