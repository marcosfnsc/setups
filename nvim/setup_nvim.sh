#!/bin/bash

# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

rm $HOME/.config/nvim/inita.vim
ln $PWD/init.vim $HOME/.config/nvim/init.vim || cp $PWD/init.vim $HOME/.config/nvim

# install coc.vim extension
nvim +PlugInstall +qa

