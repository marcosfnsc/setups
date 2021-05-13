#!/bin/bash

mkdir -p $HOME/.config/alacritty

if test -f "$HOME/.config/alacritty/alacritty.yml"; then
  rm $HOME/.config/alacritty/alacritty.yml
fi

ln alacritty.yml $HOME/.config/alacritty/alacritty.yml
