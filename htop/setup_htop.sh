#!/usr/bin/env bash

set -o errexit

symbol_link_or_copy() {
  {
    ln -f $1 $2 2>/dev/null
  } || {
    echo "erro ao criar link fisico do arquivo $1, copiando arquivo ..."
    cp -f $1 $2
  }
}

mkdir -p $HOME/.config/htop
symbol_link_or_copy htoprc $HOME/.config/htop/htoprc

echo "setup htop sucess"
