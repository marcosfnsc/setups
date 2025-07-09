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

symbol_link_or_copy bashrc $HOME/.bashrc

echo "setup bash sucess"
