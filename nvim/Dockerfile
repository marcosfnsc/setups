FROM archlinux:latest

# Install required system packages
RUN pacman -Sy --needed --noconfirm \
  gcc \
  git \
  jdk-openjdk \
  neovim \
  nodejs \
  npm \
  python \
  ripgrep \
  unzip

# create user non root
ARG UID=1000
ARG GID=1000

RUN groupadd -g "${GID}" user_name \
  && useradd --create-home --no-log-init -u "${UID}" -g "${GID}" user_name
USER user_name

WORKDIR /test

ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]
