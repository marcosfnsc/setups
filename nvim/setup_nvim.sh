#!/usr/bin/env bash

# install packer.nvim
if [ ! -d "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
  git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
fi

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

# install plugins
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

# install LSPs
if [[ -z $TERMUX_VERSION ]] ; then
  nvim --headless -c 'LspInstall clangd pyright rust_analyzer sumneko_lua texlab tsserver' -c 'qa'
else
  nvim --headless -c 'LspInstall pyright' -c 'qa'
fi
