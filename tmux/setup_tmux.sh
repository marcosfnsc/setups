#!/usr/bin/env bash

if test -f "$HOME/.tmux.conf"; then
  rm $HOME/.tmux.conf
fi

{
  ln tmux.conf $HOME/.tmux.conf 2>/dev/null
} || {  
  echo "erro ao criar link fisico, copiando arquivo ..."
  cp tmux.conf $HOME/.tmux.conf
}
