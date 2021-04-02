#!/bin/bash

# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

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
