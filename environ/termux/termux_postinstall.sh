#!/usr/bin/env bash

set -o errexit

# enable external storage
[ ! -d "$HOME/storage/" ] && termux-setup-storage

packages_list=(
  binutils # to use the strings command
  clang
  curl
  eza
  ffmpeg
  file
  git
  gnupg
  keepassxc
  man
  manpages
  ncdu
  neovim
  nmap
  nodejs
  openjdk-21
  openssh
  python
  rclone
  ripgrep
  rsync
  rust
  rust-analyzer
  shellcheck
  socat
  termux-api
  tmux
  tree
  xxd
  zsh
)

yes | pkg up
yes | pkg install x11-repo # for keepassxc
yes | pkg install ${packages_list[@]} -y

pip install yt-dlp

git clone --depth 1 https://github.com/marcosfnsc/setups.git
path_dir_setups="$(pwd)/setups"
cd $path_dir_setups/git_config && ./setup_git.sh
cd $path_dir_setups/nvim       && ./setup_minimal_nvim.sh
cd $path_dir_setups/tmux       && ./setup_tmux.sh
cd $path_dir_setups/zsh        && ./setup_zsh.sh
cd $path_dir_setups/fzf        && ./setup_fzf.sh

cd $path_dir_setups/.. && rm -rf setups

chsh -s zsh

echo set password
passwd

echo "configuração concluida!"
