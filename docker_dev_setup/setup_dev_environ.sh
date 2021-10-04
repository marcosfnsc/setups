#!/usr/bin/env bash

REPO_ROOT=$PWD/..

cd $REPO_ROOT/fzf                && ./setup_fzf.sh
cd $REPO_ROOT/git_config         && ./setup_git.sh
cd $REPO_ROOT/nvim               && ./setup_nvim.sh
cd $REPO_ROOT/tmux               && ./setup_tmux.sh

if test -f "$HOME/.zshrc"; then
  rm $HOME/.zshrc
fi

# oh-my-zsh setup
if [ ! -d "$HOME/.oh-my-zsh/" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

{
  ln $REPO_ROOT/zsh/zshrc $HOME/.zshrc 2>/dev/null
} || {
  echo "erro ao criar link fisico, copiando arquivo ..."
  cp $REPO_ROOT/zsh/zshrc $HOME/.zshrc
}

echo "exec zsh" > $HOME/.bashrc
