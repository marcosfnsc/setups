#!/usr/bin/env bash

ROOT_DIRECTORY=$PWD/../../..
cd $ROOT_DIRECTORY/fzf        && ./setup_fzf.sh
cd $ROOT_DIRECTORY/git_config && ./setup_git.sh
cd $ROOT_DIRECTORY/nvim       && ./setup_nvim.sh
cd $ROOT_DIRECTORY/tmux       && ./setup_tmux.sh
cd $ROOT_DIRECTORY/zsh        && ./setup_zsh.sh

echo "exec zsh" > $HOME/.bashrc
