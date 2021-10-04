#!/usr/bin/env bash

REPO_ROOT=$PWD/..

cd $REPO_ROOT/fzf                && ./setup_fzf.sh
cd $REPO_ROOT/git_config         && ./setup_git.sh
cd $REPO_ROOT/nvim               && ./setup_nvim.sh
cd $REPO_ROOT/tmux               && ./setup_tmux.sh
#cd $REPO_ROOT/zsh                && sudo -u $_USERNAME ./setup_zsh.sh
