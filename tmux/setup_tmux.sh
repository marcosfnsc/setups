#!/bin/bash

if test -f "$HOME/.tmux.conf"; then
  rm $HOME/.tmux.conf
fi

ln tmux.conf $HOME/.tmux.conf || cp tmux.conf $HOME/.tmux.conf
