#!/bin/bash

PACKAGES_ADD=(
  clang
  git
  nodejs
  openssh
  python
  zsh
)

pkg install  ${APPS_ADD[@]}

cd ..
cd nvim && ./setup_nvim.sh && cd ..
cd zsh  && ./setup_zsh.sh  && cd ..
