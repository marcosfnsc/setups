#!/usr/bin/env bash

REPO_ROOT=$PWD/..

cd $REPO_ROOT/fzf                && sudo -u $_USERNAME ./setup_fzf.sh
cd $REPO_ROOT/git_config         && sudo -u $_USERNAME ./setup_git.sh
cd $REPO_ROOT/nvim               && sudo -u $_USERNAME ./setup_nvim.sh
cd $REPO_ROOT/tmux               && sudo -u $_USERNAME ./setup_tmux.sh
#cd $REPO_ROOT/zsh                && sudo -u $_USERNAME ./setup_zsh.sh
