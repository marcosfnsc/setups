#!/usr/bin/env bash

set -o errexit

# enable external storage
[ ! -d "$HOME/storage/" ] && termux-setup-storage

packages_list=(
  clang
  curl
  exa
  git
  gnupg
  keepassxc
  neovim
  nmap
  nodejs
  openssh
  python
  rclone
  ripgrep
  rsync
  tmux
  tree
  zsh
)

pkg upgrade -y
pkg install x11-repo # for keepassxc
pkg install ${packages_list[@]} -y

git clone --depth 1 https://github.com/marcosfnsc/setups.git
path_dir_setups="$(pwd)/setups"
cd $path_dir_setups/git_config && ./setup_git.sh
cd $path_dir_setups/nvim       && ./setup_nvim.sh
cd $path_dir_setups/tmux       && ./setup_tmux.sh
cd $path_dir_setups/zsh        && ./setup_zsh.sh
cd $path_dir_setups/fzf        && ./setup_fzf.sh

cd $path_dir_setups/.. && rm -rf setups

chsh -s zsh
