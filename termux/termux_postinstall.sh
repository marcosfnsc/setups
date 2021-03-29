#!/bin/bash

PACKAGES_ADD=(
  clang
  git
  neovim
  nodejs
  openssh
  python
  silversearcher-ag
  tmux
  zsh
)

pkg install  ${APPS_ADD[@]}

cd ..
cd nvim && ./setup_nvim.sh && cd ..
cd zsh  && ./setup_zsh.sh  && cd ..

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install
