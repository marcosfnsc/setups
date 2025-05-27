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

mkdir -p $HOME/.config/nvim/lua
symbol_link_or_copy init.lua         $HOME/.config/nvim/init.lua
symbol_link_or_copy lua/mappings.lua $HOME/.config/nvim/lua/mappings.lua
symbol_link_or_copy lua/plugins.lua  $HOME/.config/nvim/lua/plugins.lua

echo "setup nvim sucess"
