#!/usr/bin/env bash

# external storage
termux-setup-storage

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

pkg install x11-repo -y
pkg install ${APPS_ADD[@]} -y

cd ..
cd git_config && ./setup_git.sh  && cd ..
cd nvim       && ./setup_nvim.sh && cd ..
cd tmux       && ./setup_tmux.sh && cd ..
cd zsh        && ./setup_zsh.sh  && cd ..
cd fzf        && ./setup_fzf.sh  && cd ..
cd termux
