#!/bin/bash

if test -f "$HOME/.gitconfig"; then
  rm $HOME/.gitconfig
fi

ln gitconfig $HOME/.gitconfig || cp gitconfig $HOME/.gitconfig
