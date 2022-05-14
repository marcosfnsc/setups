#!/usr/bin/env bash

DIRECTORY_CONFIG=$HOME/.config/neomutt
mkdir -p $DIRECTORY_CONFIG/{accounts,cache}
mkdir -p $DIRECTORY_CONFIG/cache/{headers,bodies}

{
  ln -f neomuttrc $HOME/.config/neomutt/neomuttrc 2>/dev/null
} || {
  echo "erro ao criar link fisico, copiando arquivo ..."
  cp -f neomuttrc $HOME/.config/neomutt/neomuttrc
}
