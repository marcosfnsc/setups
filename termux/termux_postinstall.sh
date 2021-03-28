#!/bin/bash

PACKAGES_ADD=(
  clang
  git
  neovim
  nodejs
  openssh
  python
  tmux
  zsh
)

pkg install  ${APPS_ADD[@]}

cd ..
cd nvim && ./setup_nvim.sh && cd ..
cd zsh  && ./setup_zsh.sh  && cd ..
