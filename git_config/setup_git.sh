#!/usr/bin/env bash

{
  ln -f gitconfig $HOME/.gitconfig
} || {
  echo "erro ao criar link fisico, copiando arquivo ..."
  cp -f gitconfig $HOME/.gitconfig
}
