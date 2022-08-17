#!/usr/bin/env bash

{
  ln -f tmux.conf $HOME/.tmux.conf 2>/dev/null
  ln -f tmux_theme.conf $HOME/.tmux_theme.conf 2>/dev/null
} || {
  echo "erro ao criar link fisico, copiando arquivo ..."
  cp -f tmux.conf $HOME/.tmux.conf
  cp -f tmux_theme.conf $HOME/.tmux_theme.conf
}
