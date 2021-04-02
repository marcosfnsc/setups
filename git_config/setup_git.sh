#!/bin/bash

if test -f "$HOME/.gitconfig"; then
  rm $HOME/.gitconfig
fi

{
  ln gitconfig $HOME/.gitconfig
} || {
  echo "erro ao criar link fisico, copiando arquivo ..."
  cp gitconfig $HOME/.gitconfig
}
