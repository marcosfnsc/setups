#!/bin/bash

# install vim-plug
if [ ! -f "$HOME/.local/share/nvim/site/autoload/plug.vim" ]; then
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

mkdir -p $HOME/.config/nvim

if test -f "$HOME/.config/nvim/init.vim"; then
  rm $HOME/.config/nvim/init.vim
fi

{
  ln init.vim $HOME/.config/nvim/init.vim 2>/dev/null
} || {
  echo "erro ao criar link fisico, copiando arquivo ..."
  cp init.vim $HOME/.config/nvim
}

# install vim-plug extension
nvim +PlugInstall +qa

# settings coc
if test -f "$HOME/.config/nvim/coc-settings.json"; then
  rm $HOME/.config/nvim/coc-settings.json
fi
{
  ln coc-settings.json $HOME/.config/nvim/coc-settings.json 2>/dev/null
} || {
  echo "erro ao criar link fisico, copiando arquivo ..."
  cp coc-settings.json $HOME/.config/nvim
}
