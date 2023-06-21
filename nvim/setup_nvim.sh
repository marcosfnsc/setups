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

# install LSPs
if [[ -z $TERMUX_VERSION ]] ; then
  nvim --headless -c 'LspInstall clangd pyright rust_analyzer lua_ls texlab tsserver' -c 'qa'
else
  nvim --headless -c 'LspInstall pyright' -c 'qa'
fi

echo "setup nvim sucess"
