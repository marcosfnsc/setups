#!/usr/bin/env bash

# install vim-plug
if [ ! -f "$HOME/.local/share/nvim/site/autoload/plug.vim" ]; then
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

mkdir -p $HOME/.config/nvim
if test -f "$HOME/.config/nvim/init.lua"; then
  rm $HOME/.config/nvim/init.lua
fi
{
  ln init.lua $HOME/.config/nvim/init.lua 2>/dev/null
} || {
  echo "erro ao criar link fisico, copiando arquivo ..."
  cp init.lua $HOME/.config/nvim
}

# install vim-plug extension
nvim +PlugInstall +qa

# settings coc
if test -f "$HOME/.config/nvim/coc-settings.json"; then
  rm $HOME/.config/nvim/coc-settings.json
fi

echo "{
  \"explorer.width\": 30,
  \"explorer.file.showHiddenFiles\": true," > $HOME/.config/nvim/coc-settings.json
{
  PATH_RUST_ANALYZER=$(which rust-analyzer)
  echo "  \"rust-analyzer.server.path\": \"$PATH_RUST_ANALYZER\",
  \"rust-analyzer.updates.checkOnStartup\": false" >> $HOME/.config/nvim/coc-settings.json
} || {
  echo "  \"rust-analyzer.server.path\": ''" >> $HOME/.config/nvim/coc-settings.json
}
echo "}" >> $HOME/.config/nvim/coc-settings.json
