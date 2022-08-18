#!/usr/bin/env bash

{
  ln -f tmux.conf         $HOME/.tmux.conf         2>/dev/null
  ln -f tmux_plugins.conf $HOME/.tmux_plugins.conf 2>/dev/null
  ln -f tmux_theme.conf   $HOME/.tmux_theme.conf   2>/dev/null
} || {
  echo "erro ao criar link fisico, copiando arquivo ..."
  cp -f tmux.conf         $HOME/.tmux.conf
  cp -f tmux_plugins.conf $HOME/.tmux_plugins.conf
  cp -f tmux_theme.conf   $HOME/.tmux_theme.conf
}

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ~/.tmux/plugins/tpm/bin/install_plugins
fi
