#!/usr/bin/env bash

# external storage
termux-setup-storage

PACKAGES_ADD=(
  clang
  git
  glow
  neovim
  nmap
  nodejs
  openssh
  perl # required by fzf
  python
  ripgrep
  rust-analyzer
  tmux
  tree
  zsh
)

pkg install  ${APPS_ADD[@]} -y

cd ..
cd git_config && ./setup_git.sh  && cd ..
cd nvim       && ./setup_nvim.sh && cd ..
cd tmux       && ./setup_tmux.sh && cd ..
cd zsh        && ./setup_zsh.sh  && cd ..
cd termux

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install

## config ssh
ssh-keygen -t ed25519 -a 100 -f $HOME/.ssh/id_marcosfnsc_github_sanders -C "marcosfnsc_github_sanders"
