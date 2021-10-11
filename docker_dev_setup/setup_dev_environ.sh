#!/usr/bin/env bash

REPO_ROOT=$PWD/..

cd $REPO_ROOT/fzf        && ./setup_fzf.sh
cd $REPO_ROOT/git_config && ./setup_git.sh
cd $REPO_ROOT/nvim       && ./setup_nvim.sh
cd $REPO_ROOT/tmux       && ./setup_tmux.sh
cd $REPO_ROOT/zsh        && ./setup_zsh.sh

if [ ! -f "$HOME/.bashrc-old" ]; then
  mv $HOME/.bashrc $HOME/.bashrc-old
fi
echo "exec zsh" > $HOME/.bashrc
