from archlinux:latest

RUN pacman -Sy --noconfirm reflector
RUN reflector --latest 10 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist --verbose
RUN sed -E 's/^#ParallelDownloads.+$/ParallelDownloads = 10/' -i /etc/pacman.conf
RUN pacman -S --needed --noconfirm \
  clang \
  curl \
  docker \
  docker-compose \
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
  tree \
  unzip \
  zsh

# create user non root
ARG UID=1000
ARG GID=1000
RUN groupadd -g "${GID}" marcos \
  && useradd --create-home --no-log-init -u "${UID}" -g "${GID}" marcos
USER marcos

WORKDIR /home/marcos
RUN git clone --depth 1 https://github.com/marcosfnsc/setups.git
ENV PATH_DIR_SETUPS="/home/marcos/setups"
RUN cd $PATH_DIR_SETUPS/git_config && ./setup_git.sh
RUN cd $PATH_DIR_SETUPS/nvim       && ./setup_nvim.sh
RUN cd $PATH_DIR_SETUPS/tmux       && ./setup_tmux.sh
RUN cd $PATH_DIR_SETUPS/zsh        && ./setup_zsh.sh
RUN cd $PATH_DIR_SETUPS/fzf        && ./setup_fzf.sh
RUN cd $PATH_DIR_SETUPS/.. && rm -rf setups

RUN echo "exec zsh" > /home/marcos/.bashrc

ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]
