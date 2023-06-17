#!/usr/bin/env bash

set -o errexit

#termux-setup-storage # external storage

PACKAGES_ADD=(
  clang
  curl
  exa
  git
  gnugpg
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

pkg install ${APPS_ADD[@]} -y
exit

cd ..
cd git_config && ./setup_git.sh  && cd ..
cd nvim       && ./setup_nvim.sh && cd ..
cd tmux       && ./setup_tmux.sh && cd ..
cd zsh        && ./setup_zsh.sh  && cd ..
cd fzf        && ./setup_fzf.sh  && cd ..
cd termux
