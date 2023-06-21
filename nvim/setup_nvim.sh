#!/usr/bin/env bash

set -o errexit

mkdir -p $HOME/.config/nvim/lua
{
  ln -f init.lua         $HOME/.config/nvim/init.lua         2>/dev/null
  ln -f lua/mappings.lua $HOME/.config/nvim/lua/mappings.lua 2>/dev/null
  ln -f lua/plugins.lua  $HOME/.config/nvim/lua/plugins.lua  2>/dev/null
} || {
  echo "erro ao criar link fisico, copiando arquivo ..."
  cp -f init.lua         $HOME/.config/nvim
  cp -f lua/mappings.lua $HOME/.config/nvim/lua
  cp -f lua/plugins.lua  $HOME/.config/nvim/lua
}

echo "setup nvim sucess"
